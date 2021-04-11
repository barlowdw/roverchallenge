module RoverChallenge
    class Rover
        DIRECTIONS = ['N', 'E', 'S', 'W'].freeze
        INSTRUCTIONS = ['M', 'L', 'R'].freeze
        MOVEMENT_DELTA = {
            'N' => {x: 0, y: 1},
            'E' => {x: 1, y: 0},
            'S' => {x: 0, y: -1},
            'W' => {x: -1, y: 0}
        }.freeze

        attr_reader :x, :y, :d

        def initialize(x, y, d, x1, y1, x2, y2)
            @x = Integer(x)
            @y = Integer(y)
            @d = String(d).upcase

            @x1 = Integer(x1)
            @y1 = Integer(y1)
            @x2 = Integer(x2)
            @y2 = Integer(y2)

            raise ArgumentError.new('Invalid direction') unless DIRECTIONS.include? @d
            raise ArgumentError.new('Invalid position') if @x < @x1 || @x > @x2 || @y < @y1 || @y > @y2
        end

        def move(instruction)
            instruction = String(instruction).upcase

            raise ArgumentError.new('Invalid instruction') unless INSTRUCTIONS.include? instruction

            case instruction
            when 'L'
                rotate -1
            when 'R'
                rotate 1
            when 'M'
                move_forward
            end
        end

        private

        def rotate(direction)
            i = DIRECTIONS.index(@d) + direction
            i = 0 if i >= DIRECTIONS.length
            i = DIRECTIONS.length - 1 if i < 0
            @d = DIRECTIONS[i]
        end

        def move_forward
            delta = MOVEMENT_DELTA[@d]

            @x = @x + delta[:x]
            @y = @y + delta[:y]

            @x = @x1 if @x < @x1
            @x = @x2 if @x > @x2
            @y = @y1 if @y < @y1
            @y = @y2 if @y > @y2
        end
    end
end