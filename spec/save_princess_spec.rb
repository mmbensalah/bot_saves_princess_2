require_relative '../lib/save_princess'

RSpec.describe SavePrincess do
  describe '#display_path_to_princess' do
    context '3x3 matrix with bot in 0,0 position and princess in 2,2' do
      before do
        size   = 3
        bot_coordinates = [0,0]
        @matrix = Matrix.new(size, Bot.new(bot_coordinates))
        @matrix.instance_variable_set(:@matrix,
          [["m","-","-"],["-","-","-"],["-","-","p"]])
        @matrix.find_princess_position
        @game = SavePrincess.new(@matrix)
      end

      it 'displays correct instructions' do
        expect { @game.display_path_to_princess }
          .to output("RIGHT\n").to_stdout
      end
    end

    context '3x3 matrix with bot in 2,2 position and princess in 0,0' do
      before do
        size   = 3
        bot_coordinates = [2,2]
        @matrix = Matrix.new(size, Bot.new(bot_coordinates))
        @matrix.instance_variable_set(:@matrix,
          [["p","-","-"],["-","-","-"],["-","-","m"]])
        @matrix.find_princess_position
        @game = SavePrincess.new(@matrix)
      end

      it 'displays correct instructions' do
        expect { @game.display_path_to_princess }
          .to output("LEFT\n").to_stdout
      end
    end

    context '4x4 matrix with bot in 0,0 position and princess in 4,4' do
      before do
        size   = 3
        bot_coordinates = [0,0]
        @matrix = Matrix.new(size, Bot.new(bot_coordinates))
        @matrix.instance_variable_set(:@matrix,
          [["m","-","-","-"],["-","-","-","-"],["-","-","-","-"],
           ["-","-","-","p"]])
        @matrix.find_princess_position
        @game = SavePrincess.new(@matrix)
      end

      it 'displays correct instructions' do
        expect { @game.display_path_to_princess }
          .to output("RIGHT\n").to_stdout
      end
    end
  end
end
