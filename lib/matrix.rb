require_relative '../lib/bot'
require_relative '../lib/princess'

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

  # def find_bot_position
  #   x = @matrix.count/2
  #   y = @matrix.count/2
  #   @bot = Bot.new([y, x])
  # end
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
