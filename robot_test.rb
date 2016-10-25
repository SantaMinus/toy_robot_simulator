require './robot'

RSpec.describe Robot do
  before(:each) do
    @robot = Robot.new
  end

  describe "#place" do
    it 'places a @robot on a table' do
      coords = {
        x: 2,
        y: 1,
        dir: 'NORTH'
      }
      @robot.place('2,1,NORTH')

      expect(@robot.position).to eq(coords)
    end

    it 'prints an error if the @robot is not on a table' do
      @robot.place('5,1,NORTH')

      expect(@robot.position).to eq(nil)
    end
  end

  describe '#move' do
    it 'should move forward if there\'s space' do
      new_coords = {
        x: 2,
        y: 2,
        dir: 'NORTH'
      }

      @robot.place('2,1,NORTH')
      @robot.move

      expect(@robot.position).to eq(new_coords)
    end

    it 'should stay in place if there\'s nowhere to move' do
      @robot.place('2,4,NORTH')
      pos = @robot.position
      @robot.move

      expect(@robot.position).to eq(pos)
    end
  end

  describe '#turn' do
    it 'should turn left' do
      @robot.place('2,4,NORTH')
      dir = @robot.position[:dir]
      @robot.turn('LEFT')

      expect(@robot.position[:dir]).to eq('WEST')
    end

    it 'should turn right' do
      @robot.place('2,4,WEST')
      dir = @robot.position[:dir]
      @robot.turn('RIGHT')

      expect(@robot.position[:dir]).to eq('NORTH')
    end
  end
end
