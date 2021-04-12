module RoverChallenge
    class CLI
        def self.run
            input = $stdin.read
            mission = MissionFactory.create_from_text input
            puts mission
        end
    end
end