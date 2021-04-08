module RoverChallenge
    class Rover
        attr_reader :x, :y, :d

        def initialize(x, y, d)
            @x = Integer(x)
            @y = Integer(y)
            @d = String(d).upcase

            raise ArgumentError.new('Invalid direction') unless ['N', 'E', 'S', 'W'].include? @d
        end
    end
end