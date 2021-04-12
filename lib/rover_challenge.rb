require_relative 'rover_challenge/cli'
require_relative 'rover_challenge/mission'
require_relative 'rover_challenge/mission_factory'
require_relative 'rover_challenge/rover'


if __FILE__ == $0
    RoverChallenge::CLI.run
end