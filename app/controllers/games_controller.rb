class GamesController < ApplicationController
	attr_accessor :is_Obstructed,:timepass
	
	def index
		if current_user 
			@games = Game.available
			@game_user= Game.where('status = ? AND ( black_player_id = ? OR white_player_id = ? )', -1,current_user.id,current_user.id)
			@game_user_won = Game.where(status:current_user.id)
		end
		
	end

	def new
		@game=Game.new
	end

	def create
		#puts current_user.id
    	@game=Game.create(white_player_id: current_user.id,status:-1)
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
			@pieces=@game.pieces
		else
			render plain: "#{status.to_s.titleize}", status: :not_found
		end
	end

	def update
		@game=Game.find(params[:id])
		if @game.white_player_id == nil || @game.black_player_id == nil 
			alert = "Why do you want to forfeit when your opponent do not exist?"
			redirect_to game_path(@game), alert:alert
		else
			if @game.white_player_id == current_user.id
				winner = @game.black_player_id
			else
				winner = @game.white_player_id
			end
			@game.update_attributes(status:winner)
		end
		redirect_to root_path
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
