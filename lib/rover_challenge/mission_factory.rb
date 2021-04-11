module RoverChallenge
    class MissionFactory
        def self.create_from_text(input_text)
            mission = nil
            position_line = nil

            input_text.split("\n").each_with_index do |line, i|  
                if i == 0
                    values = line.split(' ')
                    mission = Mission.new(values[0], values[1])
                elsif i % 2 == 1
                    position_line = line
                else
                    values = position_line.split(' ')
                    mission.add_rover(values[0], values[1], values[2], line)
                end
            end

            mission
        end
    end
end