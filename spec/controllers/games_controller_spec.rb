require 'rails_helper'

RSpec.describe GamesController, :type => :controller do
    describe "game#show action" do
        it "should return status code of 404 not found if the game do not exist" do
            user = FactoryBot.create(:user)
            sign_in user
            get :show, params: { id: "ANYTHING" }
            expect(response).to have_http_status :not_found
        end
    end
end
