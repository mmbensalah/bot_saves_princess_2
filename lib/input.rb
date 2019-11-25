class Input
  attr_reader :matrix_size

  def self.first_instructions
    puts "Enter a number less than 100 to create matrix"
  end

  def self.get_matrix_size
    @size = $stdin.gets.chomp.to_i
  end

  def self.get_bot_coordinates
    coordinates = $stdin.gets.gsub(/\s+/, "").chars.map{|int| int.to_i}
    error_message(coordinates)
    coordinates
  end

  def self.second_instructions
    puts "Enter the coordinates of the bot i.e. 2 3"
  end

  def self.third_instructions
    puts "Enter the matrix with the bot and princess in their positions"
  end

  def self.error_message(input)
    if input.first >= @size
      raise ArgumentError.new("Those coordinates do not exist.")
    end
  end
end
