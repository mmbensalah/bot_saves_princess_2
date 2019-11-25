require_relative 'lib/save_princess'

Input.first_instructions

size = Input.get_matrix_size

Input.second_instructions

bot_coordinates = Input.get_bot_coordinates

matrix = Matrix.new(size, Bot.new(bot_coordinates))

Input.third_instructions

game = SavePrincess.new(matrix)

matrix.build_matrix

matrix.find_princess_position

game.display_path_to_princess
