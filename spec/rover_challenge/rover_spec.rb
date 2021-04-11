require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

module RoverChallenge
  describe Rover do
    describe '#new' do
      it 'should create Rover' do
        rover = Rover.new(1, 2, 'N', 0, 0, 5, 5)

        expect(rover.x).to eq 1
        expect(rover.y).to eq 2
        expect(rover.d).to eq 'N'
      end

      it 'should create Rover using string inputs only' do
        rover = Rover.new('1', '2', 'N', 0, 0, 5, 5)

        expect(rover.x).to eq 1
        expect(rover.y).to eq 2
        expect(rover.d).to eq 'N'
      end

      it 'should raise error for invalid coordinate types' do
        expect { Rover.new('zero', '2', 'N', 0, 0, 5, 5) }.to raise_error(ArgumentError)
        expect { Rover.new('1', 'zero', 'N', 0, 0, 5, 5) }.to raise_error(ArgumentError)
        expect { Rover.new('', '2', 'N', 0, 0, 5, 5) }.to raise_error(ArgumentError)
        expect { Rover.new('1', nil, 'N', 0, 0, 5, 5) }.to raise_error(TypeError)
      end

      it 'should truncate cordinates to integer values' do
        rover = Rover.new(3.14, 2.71828, 'N', 0, 0, 5, 5)

        expect(rover.x).to eq 3
        expect(rover.y).to eq 2
      end

      it 'should raise error for invalid direction' do
        expect { Rover.new('1', '2', 'Z', 0, 0, 5, 5) }.to raise_error(ArgumentError)
        expect { Rover.new('1', '2', 0, 0, 0, 5, 5) }.to raise_error(ArgumentError)
        expect { Rover.new('1', '2', nil, 0, 0, 5, 5) }.to raise_error(ArgumentError)
      end

      it 'should convert direction to upper case' do
        expect(Rover.new(1, 2, 'n', 0, 0, 5, 5).d).to eq 'N'
        expect(Rover.new(1, 2, 'e', 0, 0, 5, 5).d).to eq 'E'
        expect(Rover.new(1, 2, 's', 0, 0, 5, 5).d).to eq 'S'
        expect(Rover.new(1, 2, 'w', 0, 0, 5, 5).d).to eq 'W'
      end
    end

    describe '#move' do
      it 'should raise error for invalid instruction' do
        rover = Rover.new(1, 2, 'N', 0, 0, 5, 5)

        expect { rover.move 'k' }.to raise_error(ArgumentError)
        expect { rover.move 1 }.to raise_error(ArgumentError)
      end

      it 'should rotate left' do
        rover = Rover.new(1, 2, 'N', 0, 0, 5, 5)
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
        rover = Rover.new(1, 2, 'N', 0, 0, 5, 5)
        rover.move 'l'

        expect(rover.d).to eq 'W'
      end

      it 'should rotate right' do
        rover = Rover.new(1, 2, 'N', 0, 0, 5, 5)
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
        rover = Rover.new(1, 2, 'N', 0, 0, 5, 5)
        rover.move 'r'

        expect(rover.d).to eq 'E'
      end

      it 'should move North' do
        rover = Rover.new(1, 2, 'N', 0, 0, 5, 5)
        rover.move 'M'

        expect(rover.x).to eq 1
        expect(rover.y).to eq 3
        expect(rover.d).to eq 'N'
      end

      it 'should move East' do
        rover = Rover.new(1, 2, 'E', 0, 0, 5, 5)
        rover.move 'M'

        expect(rover.x).to eq 2
        expect(rover.y).to eq 2
        expect(rover.d).to eq 'E'
      end

      it 'should move South' do
        rover = Rover.new(1, 2, 'S', 0, 0, 5, 5)
        rover.move 'M'

        expect(rover.x).to eq 1
        expect(rover.y).to eq 1
        expect(rover.d).to eq 'S'
      end

      it 'should move West' do
        rover = Rover.new(1, 2, 'W', 0, 0, 5, 5)
        rover.move 'M'

        expect(rover.x).to eq 0
        expect(rover.y).to eq 2
        expect(rover.d).to eq 'W'
      end

      it 'should not move North out of bounds' do
        rover = Rover.new(2, 5, 'N', 0, 0, 5, 5)
        rover.move 'M'

        expect(rover.x).to eq 2
        expect(rover.y).to eq 5
        expect(rover.d).to eq 'N'
      end

      it 'should not move East out of bounds' do
        rover = Rover.new(5, 2, 'E', 0, 0, 5, 5)
        rover.move 'M'

        expect(rover.x).to eq 5
        expect(rover.y).to eq 2
        expect(rover.d).to eq 'E'
      end

      it 'should not move South out of bounds' do
        rover = Rover.new(2, 0, 'S', 0, 0, 5, 5)
        rover.move 'M'

        expect(rover.x).to eq 2
        expect(rover.y).to eq 0
        expect(rover.d).to eq 'S'
      end

      it 'should not move South out of bounds' do
        rover = Rover.new(0, 2, 'W', 0, 0, 5, 5)
        rover.move 'M'

        expect(rover.x).to eq 0
        expect(rover.y).to eq 2
        expect(rover.d).to eq 'W'
      end
    end

    it 'should do example 1 movements' do
      rover = Rover.new(1, 2, 'N', 0, 0, 5, 5)

      'LMLMLMLMM'.split('').each { |instruction| rover.move instruction }

      expect(rover.x).to eq 1
      expect(rover.y).to eq 3
      expect(rover.d).to eq 'N'
    end

    it 'should do example 2 movements' do
      rover = Rover.new(3, 3, 'E', 0, 0, 5, 5)

      'MMRMMRMRRM'.split('').each { |instruction| rover.move instruction }

      expect(rover.x).to eq 5
      expect(rover.y).to eq 1
      expect(rover.d).to eq 'E'
    end
  end
end


