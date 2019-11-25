require_relative 'input'
require_relative 'matrix'
require_relative 'bot'
require_relative 'princess'

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
