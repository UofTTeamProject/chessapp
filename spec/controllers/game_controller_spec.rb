
require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe "games#join action" do
    it "joins a logged in player to the game" do
      user1 = FactoryBot.create(:user)
      game = FactoryBot.create(:game, white_player_id: user1.id)
      user2 = FactoryBot.create(:user)
      sign_in user2
      put :join, params: { id: game.id }
      #verify game has second player as black_player_id
      game.reload
      expect(game.black_player_id).to eq(user2.id)
      #verify that we're redirected to the game's show page
      expect(response).to redirect_to(game_path(game.id))
    end

    it "does not allow a player to join a game they are already in" do
      #create a user
      #create a game with that user
      #login with user
      #put request to join game
      #verify we get an error mesaage
      #verify that game does not have a second player
      #verify we're redirected to the home#index page
      user1 = FactoryBot.create(:user)
      game = FactoryBot.create(:game, white_player_id: user1.id)
      sign_in user1
      put :join, params: { id: game.id }
      game.reload
      expect(game.black_player_id).to be_nil
      expect(response).to redirect_to(root_path)
    end

    it "does not allow a player to join a game if not signed in" do
      user1 = FactoryBot.create(:user)
      game = FactoryBot.create(:game, white_player_id: user1.id)
      put :join, params: { id: game.id }
      game.reload
      expect(game.black_player_id).to be_nil
      expect(response).to redirect_to(root_path)
      #verify that black_player_id is still nil after reloading
      #verify redirected to home#index
    end

    it "does not allow a player to join a game if there are already two players" do
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user)
      user3 = FactoryBot.create(:user)

      game = FactoryBot.create(:game, white_player_id: user1.id, black_player_id: user2.id)

      sign_in user3
      put :join, params: {id: game.id}
      game.reload
      expect(game.white_player_id).to eq(user1.id)
      expect(game.black_player_id).to eq(user2.id)
      expect(response).to redirect_to(root_path)
    end
  end

  describe "games#create action" do
    
  end

end
