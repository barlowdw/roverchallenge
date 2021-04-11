require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

module RoverChallenge
  describe Mission do
    describe '#add_rover' do
      it 'should add one rover without instrusctions' do
        mission = Mission.new(5, 5)

        mission.add_rover(2, 1, 'N', '')

        expect(mission.rovers.length).to eq 1
        expect(mission.rovers[0].x).to eq 2
        expect(mission.rovers[0].y).to eq 1
        expect(mission.rovers[0].d).to eq 'N'
      end

      it 'should add multiple rovers without instrusctions' do
        mission = Mission.new(5, 5)

        mission.add_rover(2, 1, 'N', '')
        mission.add_rover(1, 1, 'W', '')
        mission.add_rover(5, 5, 'S', '')
        mission.add_rover(3, 4, 'E', '')
        mission.add_rover(2, 2, 'N', '')
        mission.add_rover(2, 4, 'E', '')

        expect(mission.rovers.length).to eq 6

        expect(mission.rovers[0].x).to eq 2
        expect(mission.rovers[0].y).to eq 1
        expect(mission.rovers[0].d).to eq 'N'

        expect(mission.rovers[1].x).to eq 1
        expect(mission.rovers[1].y).to eq 1
        expect(mission.rovers[1].d).to eq 'W'

        expect(mission.rovers[2].x).to eq 5
        expect(mission.rovers[2].y).to eq 5
        expect(mission.rovers[2].d).to eq 'S'

        expect(mission.rovers[3].x).to eq 3
        expect(mission.rovers[3].y).to eq 4
        expect(mission.rovers[3].d).to eq 'E'

        expect(mission.rovers[4].x).to eq 2
        expect(mission.rovers[4].y).to eq 2
        expect(mission.rovers[4].d).to eq 'N'

        expect(mission.rovers[5].x).to eq 2
        expect(mission.rovers[5].y).to eq 4
        expect(mission.rovers[5].d).to eq 'E'
      end

      it 'should add one rover with instrusctions' do
        mission = Mission.new(5, 5)

        mission.add_rover(2, 1, 'N', 'MMLMM')

        expect(mission.rovers.length).to eq 1
        expect(mission.rovers[0].x).to eq 0
        expect(mission.rovers[0].y).to eq 3
        expect(mission.rovers[0].d).to eq 'W'
      end

      it 'should add multiple rovers with instrusctions' do
        mission = Mission.new(5, 5)

        mission.add_rover(1, 2, 'N', 'LMLMLMLMM')
        mission.add_rover(3, 3, 'E', 'MMRMMRMRRM')

        expect(mission.rovers.length).to eq 2

        expect(mission.rovers[0].x).to eq 1
        expect(mission.rovers[0].y).to eq 3
        expect(mission.rovers[0].d).to eq 'N'

        expect(mission.rovers[1].x).to eq 5
        expect(mission.rovers[1].y).to eq 1
        expect(mission.rovers[1].d).to eq 'E'
      end
    end

    describe '#to_s' do
        xit 'should display output' do
            mission = Mission.new(5, 5)

            mission.add_rover(1, 2, 'N', 'LMLMLMLMM')
            mission.add_rover(3, 3, 'E', 'MMRMMRMRRM')

            expect(mission.to_s).to eq <<~MISSION
                1 3 N
                5 1 E
            MISSION
        end
    end
  end
end