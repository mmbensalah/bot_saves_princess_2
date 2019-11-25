class Input
  def initialize
  end

  def get_matrix_size
    @size = $stdin.gets.chomp.to_i
  end

  def get_bot_coordinates
    coordinates = $stdin.gets.gsub(/\s+/, "").chars.map{|int| int.to_i}
    error_message(coordinates)
    coordinates
  end

  def error_message(input)
    if input.first >= @size
      raise ArgumentError.new("Those coordinates do not exist.")
    end
  end
end

class Matrix
  attr_reader :size, :matrix, :princess, :bot

  def initialize(size, bot)
    @size = size
    @bot = bot
  end

  def build_matrix
    matrix = []
    @size.times do
      matrix << get_input_matrix
    end
    @matrix = matrix.map{|row| row.chars}
  end

  def find_princess_position
    @matrix.each_with_index do |row, x|
      row.each_with_index do |position, y|
        @princess = Princess.new([y, x]) if position == "p"
      end
    end
    @princess
  end

  private

  def get_input_matrix
    $stdin.gets.chomp
  end
end

class SavePrincess
  attr_reader :matrix

  def initialize(matrix)
    @matrix = matrix
  end

  def display_path_to_princess
    if delta_coordinates[0] != 0
      translate_x_coordinates
    else
      translate_y_coordinates
    end
  end

  private

  def translate_x_coordinates
    if delta_coordinates[0] < 0
      puts "LEFT"
    elsif delta_coordinates[0] > 0
      puts "RIGHT"
    end
  end

  def translate_y_coordinates
    if delta_coordinates[1] < 0
      puts "DOWN"
    elsif delta_coordinates[1] > 0
      puts "UP"
    end
  end

  def delta_coordinates
    delta_position = []
    delta_position << @matrix.princess.coordinates[0] - @matrix.bot.coordinates[0]
    delta_position << @matrix.bot.coordinates[1] - @matrix.princess.coordinates[1]
    delta_position
  end
end

class Princess
  attr_reader :coordinates
  def initialize(coordinates)
    @coordinates = coordinates
  end
end

class Bot
  attr_reader :coordinates
  def initialize(coordinates)
    @coordinates = coordinates
  end
end

input = Input.new
size = input.get_matrix_size
bot_coordinates = input.get_bot_coordinates
matrix = Matrix.new(size, Bot.new(bot_coordinates))
game = SavePrincess.new(matrix)
matrix.build_matrix
matrix.find_princess_position
game.display_path_to_princess
