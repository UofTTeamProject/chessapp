class PiecesController < ApplicationController
	def show
		@game = Game.find(params[:game_id])
		@pieces=@game.pieces
	end
	def update
		@piece=Piece.find_by_id(params[:id])
		@game=@piece.game
	end
	private
	def piece_params
		params.require(:piece).permit(:x_position, :y_postion, :piece_type)
	end
end
