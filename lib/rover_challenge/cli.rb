module RoverChallenge
    class CLI
        def self.run
            input = ARGV[0] ? ARGV[0] : $stdin.read
            mission = MissionFactory.create_from_text input
            puts mission
        end
    end
end