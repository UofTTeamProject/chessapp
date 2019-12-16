require 'rails_helper'

RSpec.describe GamesController, :type => :controller do
    describe "#timepass" do
	it "should return true if there is no piece in between start and destination position " do
            @controller = GamesController.new
            #test for just next positions
            expect(@controller.instance_eval{ is_Obstructed(1,1,1,1) }).to eq(false)
            #expect(@controller.instance_eval{ is_Obstructed(1,1,1,2) }).to eq(false)
            #expect(@controller.instance_eval{ is_Obstructed(1,1,2,1) }).to eq(false)

	end
    end
end
