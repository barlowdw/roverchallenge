require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

module RoverChallenge
  describe Rover do
    it 'should create Rover' do
      rover = Rover.new(1, 2, 'N')

      expect(rover.x).to eq 1
      expect(rover.y).to eq 2
      expect(rover.d).to eq 'N'
    end
  end
end


