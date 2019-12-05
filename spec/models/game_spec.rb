require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "Game#available" do
    it "returns a game with a missing black_player_id" do
      game = Game.new
      game.white_player_id = 1
      game.save
      available_games = Game.available
      puts available_games.inspect
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
end

