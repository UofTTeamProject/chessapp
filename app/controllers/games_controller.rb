
class GamesController < ApplicationController
	def index
	end

	def new
	end

	def create
    Game.create(white_player_id: current_user.id)
	end
	
	def show
	end

  def join
    game = Game.find(game_params[:id])
    if !game.full? && current_user && game.white_player_id != current_user.id
      game.black_player_id = current_user.id
      game.save
      redirect_to game
    else
      redirect_to root_path
    end
  end

  private
  def game_params
    params.permit(:id)
  end
end
