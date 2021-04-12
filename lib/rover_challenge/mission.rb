module RoverChallenge
    class Mission
        attr_reader :rovers

        def initialize(x2, y2)
            @x1 = Integer(0)
            @y1 = Integer(0)
            @x2 = Integer(x2)
            @y2 = Integer(y2)
            @rovers = []
        end

        def add_rover(x, y, d, instructions)
            rover = Rover.new(x, y, d, @x1, @y1, @x2, @y2)
            instructions.split('').each { |instruction| rover.move instruction }

            @rovers.push(rover)
        end

        def to_s
            @rovers.map { |rover| rover.to_s }.join("\n") + "\n"
        end
    end
end