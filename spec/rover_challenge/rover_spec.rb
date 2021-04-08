require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

module RoverChallenge
  describe Rover do
    it 'should create Rover' do
      rover = Rover.new(1, 2, 'N')

      expect(rover.x).to eq 1
      expect(rover.y).to eq 2
      expect(rover.d).to eq 'N'
    end

    it 'should create Rover using string inputs only' do
      rover = Rover.new('1', '2', 'N')

      expect(rover.x).to eq 1
      expect(rover.y).to eq 2
      expect(rover.d).to eq 'N'
    end

    it 'should raise error for invalid coordinate types' do
      expect { Rover.new('zero', '2', 'N') }.to raise_error(ArgumentError)
      expect { Rover.new('1', 'zero', 'N') }.to raise_error(ArgumentError)
      expect { Rover.new('', '2', 'N') }.to raise_error(ArgumentError)
      expect { Rover.new('1', nil, 'N') }.to raise_error(TypeError)
    end

    it 'should truncate cordinates to integer values' do
      rover = Rover.new(3.14, 2.71828, 'N')

      expect(rover.x).to eq 3
      expect(rover.y).to eq 2
    end

    it 'should raise error for invalid direction' do
      expect { Rover.new('1', '2', 'Z') }.to raise_error(ArgumentError)
      expect { Rover.new('1', '2', 0) }.to raise_error(ArgumentError)
      expect { Rover.new('1', '2', nil) }.to raise_error(ArgumentError)
    end

    it 'should convert direction to upper case' do
      expect(Rover.new(1, 2, 'n').d).to eq 'N'
      expect(Rover.new(1, 2, 'e').d).to eq 'E'
      expect(Rover.new(1, 2, 's').d).to eq 'S'
      expect(Rover.new(1, 2, 'w').d).to eq 'W'
    end
  end
end


