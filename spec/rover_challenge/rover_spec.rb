require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

module RoverChallenge
  describe Rover do
    describe '#new' do
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

    describe '#move' do
      it 'should raise error for invalid instruction' do
        rover = Rover.new(1, 2, 'N')

        expect { rover.move 'k' }.to raise_error(ArgumentError)
        expect { rover.move 1 }.to raise_error(ArgumentError)
      end

      it 'should rotate left' do
        rover = Rover.new(1, 2, 'N')
        rover.move 'L'

        expect(rover.x).to eq 1
        expect(rover.y).to eq 2
        expect(rover.d).to eq 'W'

        rover.move 'L'

        expect(rover.d).to eq 'S'

        rover.move 'L'

        expect(rover.d).to eq 'E'

        rover.move 'L'

        expect(rover.d).to eq 'N'
      end

      it 'should rotate left with lower case' do
        rover = Rover.new(1, 2, 'N')
        rover.move 'l'

        expect(rover.d).to eq 'W'
      end

      it 'should rotate right' do
        rover = Rover.new(1, 2, 'N')
        rover.move 'R'

        expect(rover.x).to eq 1
        expect(rover.y).to eq 2
        expect(rover.d).to eq 'E'

        rover.move 'R'

        expect(rover.d).to eq 'S'

        rover.move 'R'

        expect(rover.d).to eq 'W'

        rover.move 'R'

        expect(rover.d).to eq 'N'
      end

      it 'should rotate right with lower case' do
        rover = Rover.new(1, 2, 'N')
        rover.move 'r'

        expect(rover.d).to eq 'E'
      end

      it 'should move North' do
        rover = Rover.new(1, 2, 'N')
        rover.move 'M'

        expect(rover.x).to eq 1
        expect(rover.y).to eq 3
        expect(rover.d).to eq 'N'
      end

      it 'should move East' do
        rover = Rover.new(1, 2, 'E')
        rover.move 'M'

        expect(rover.x).to eq 2
        expect(rover.y).to eq 2
        expect(rover.d).to eq 'E'
      end

      it 'should move South' do
        rover = Rover.new(1, 2, 'S')
        rover.move 'M'

        expect(rover.x).to eq 1
        expect(rover.y).to eq 1
        expect(rover.d).to eq 'S'
      end

      it 'should move West' do
        rover = Rover.new(1, 2, 'W')
        rover.move 'M'

        expect(rover.x).to eq 0
        expect(rover.y).to eq 2
        expect(rover.d).to eq 'W'
      end
    end
  end
end


