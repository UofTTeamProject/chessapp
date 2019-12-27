class GamesController < ApplicationController
	attr_accessor :is_Obstructed,:timepass
	
	def index
		@games = Game.available
		@game_user= Game.where(black_player_id:current_user.id).or(Game.where(white_player_id:current_user.id))
		
	end

	def new
		@game=Game.new
	end

	def create
		puts current_user.id
    	@game=Game.create(white_player_id: current_user.id)
    	redirect_to game_path(@game)
	end
	
	def show
		#puts is_Obstructed?(4,1,3,5)
		#puts "Hello" + params[:id].to_s
		@game=Game.find_by_id(params[:id])
		
		if !@game.blank?
			if !@game.black_player_id.nil? 
				@black_player = User.find(@game.black_player_id)
			else
				@black_player = nil
			end
			@white_player = User.find(@game.white_player_id)
			@pieces=@game.pieces.where(captured:false)
		else
			render plain: "#{status.to_s.titleize}", status: :not_found
		end
	end

	def update
		@game=Game.find(params[:id])
	end

	def join
		@game = Game.find(params[:id])
		if !@game.full? && current_user && @game.white_player_id != current_user.id
			@game.black_player_id = current_user.id
			@game.save
			redirect_to game_path(@game)
		else
			redirect_to root_path
		end
	end

	private

	def game_params
		params.permit(:id)
		#params.require(:game).permit(:white_player_id, :black_player_id)
	end

	

	def current_game
		@current_game ||= Game.find(params[:id])
	end

end
