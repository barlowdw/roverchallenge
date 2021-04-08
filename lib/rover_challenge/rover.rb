module RoverChallenge
    class Rover
        attr_reader :x, :y, :d

        def initialize(x, y, d)
            @x = x
            @y = y
            @d = d
        end
    end
end