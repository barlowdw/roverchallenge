require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

module RoverChallenge
    describe MissionFactory do
        describe '.create_from_text' do
            it 'should add multiple rovers without instrusctions' do
                mission = MissionFactory.create_from_text <<~MISSION
                    5 5
                    1 2 N
                    LMLMLMLMM
                    3 3 E
                    MMRMMRMRRM
                MISSION

                expect(mission.rovers.length).to eq 2

                expect(mission.rovers[0].x).to eq 1
                expect(mission.rovers[0].y).to eq 3
                expect(mission.rovers[0].d).to eq 'N'

                expect(mission.rovers[1].x).to eq 5
                expect(mission.rovers[1].y).to eq 1
                expect(mission.rovers[1].d).to eq 'E'
            end
        end
    end
end