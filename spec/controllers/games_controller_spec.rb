require 'rails_helper'

RSpec.describe GamesController, :type => :controller do
    describe "#is_obstructed" do
	    it "should return true if there is no piece in between start and destination position " do
            @controller = GamesController.new
            #test for just next positions
            expect(@controller.instance_eval{ is_Obstructed(1,1,1,1) }).to eq(false)
            #expect(@controller.instance_eval{ is_Obstructed(1,1,1,2) }).to eq(false)
            #expect(@controller.instance_eval{ is_Obstructed(1,1,2,1) }).to eq(false)
	    end
    end
    describe "game#show action" do
        it "should return status code of 404 not found if the game do not exist" do
            user = FactoryBot.create(:user)
            sign_in user
            get :show, params: { id: "ANYTHING" }
            expect(response).to have_http_status :not_found
        end
    end
end
