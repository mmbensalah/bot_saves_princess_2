require_relative '../lib/matrix'

RSpec.describe Matrix do
  before do
    allow($stdin).to receive(:gets).and_return("3")
    size = $stdin.gets.to_i
    allow($stdin).to receive(:gets).and_return([0,0])
    bot = $stdin.gets
    @matrix = Matrix.new(size, Bot.new(bot))
  end

  describe '#initialize' do
    it "initializes with matrix size and bot coordinates from Input" do
      expect(@matrix.size).to eq(3)
      expect(@matrix.bot).to be_an_instance_of(Bot)
      expect(@matrix.bot.coordinates).to eq([0,0])
    end
  end

  describe '#find_princess_position' do
    before do
      @matrix.instance_variable_set(:@matrix, [["-","-","-"],["-","m","-"],["p","-","-"]])
    end

    it "finds coordinates for princess(p)" do
      princess = @matrix.find_princess_position
      expect(princess).to be_an_instance_of(Princess)
      expect(princess.coordinates).to eq([0,2])
    end
  end
end
