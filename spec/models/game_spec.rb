require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "Game#available" do
    it "returns a game with a missing black_player_id" do
      game = Game.new
      game.white_player_id = 1
      game.save
      available_games = Game.available
      assert available_games.first == game
    end

    it "returns a game with a missing white_player_id" do
      game = Game.new
      game.black_player_id = 1
      game.save
      available_games = Game.available
      assert available_games.first == game
    end

    it "returns all available games" do
      game1 = Game.new
      game2 = Game.new
      game1.white_player_id = 1
      game2.black_player_id = 1
      game1.save
      game2.save
      available_games = Game.available
      assert available_games.find(game1.id)
      assert available_games.find(game2.id)
    end

    it "does not return games with a white_player_id and black_player_id" do
      game = Game.new
      game.white_player_id = 1
      game.black_player_id = 1
      game.save
      available_games = Game.available
      assert available_games.first != game
    end
  end

  describe "Game#full?" do
    it "is full if there is a white player and a black player" do
      game = Game.new
      game.white_player_id = 1
      game.black_player_id = 2
      game.save
      game.reload
      expect(game.full?).to be true
    end

    it "is not full if there is a white player but no black player" do
      game = Game.new
      game.white_player_id = 1
      game.save
      game.reload
      expect(game.full?).to be false
    end

    it "is not full if there is a black player but no white player" do
      game = Game.new
      game.black_player_id = 1
      game.save
      game.reload
      expect(game.full?).to be false
    end
  end

  describe "Game#find_by_player_id" do
    it "should show the game if you are the white player" do
      user1 = FactoryBot.create(:user)
      FactoryBot.create(:game, white_player_id: user1.id)
      found_game = Game.find_by_player_id(user1.id).first
      expect(game.id).to eq(found_game.id)
    end

    it "should show the game if you are the black player" do
      user1 = FactoryBot.create(:user)
      FactoryBot.create(:game, black_player_id: user1.id)
      found_game = Game.find_by_player_id(user1.id).first
      expect(game.id).to eq(found_game.id)
    end

    it "should not show the games that you do not belong to" do
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user)
      user3 = FactoryBot.create(:user)
      FactoryBot.create(:game, white_player_id: user1.id, black_player_id: user2.id)
      found_games = Game.find_by_player_id(user3.id)
      expect(found_game.count).to eq(0)
    end

    it "should show all the games that you belong to" do
      user1 = FactoryBot.create(:user)
      FactoryBot.create(:game, white_player_id: user1.id)
      FactoryBot.create(:game, white_player_id: user1.id)
      found_games = Game.find_by_player_id(user1.id)
      expect(found_game.count).to eq(2)
    end
  end
end

