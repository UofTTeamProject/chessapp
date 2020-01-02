class PiecesController < ApplicationController
	def show
		@game = Game.find_by_id(params[:game_id])
		@selected_piece= Piece.find_by_id(params[:id])
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
		@piece=Piece.find_by_id(params[:id])
		if !@piece.blank?
			isObstructed = is_Obstructed(@piece.x_position,@piece.y_position,piece_params[:x_position].to_i,piece_params[:y_position].to_i)
			puts @piece.type
			if isObstructed == false || @piece.type=="Knight"
				move_status=@piece.move_to(piece_params[:x_position],piece_params[:y_position])
				if !move_status
					render plain: "Not a valid Move",status: :not_acceptable
				else
					render json: {'player_data' => capturepieceSection(@piece)}, status: :partial_content
				end
			else
				if isObstructed==true
					alert = "Not a valid move as there is obstruction in-between"
				else
					alert = isObstructed
				end
				render plain: alert, status: :not_acceptable
			end
		end
		#commented as ajax call is implemented
		#@game=Game.find_by_id(params[:game_id])
		#if !@game.blank?
			#redirect_to game_path(@game) , alert: alert
		#else
			#redirect_to root_path , alert: alert
		#end	
	end
	
	private
	def piece_params
		params.require(:piece).permit(:x_position, :y_position)
	end

	def is_Obstructed(start_x,start_y,dest_x,dest_y)
		#it is assumed that checks like both start and destiantion are not same are already done. Hence not checked here
		#return
		# { 
		#	true : if there is obstruction
		#   false : if there is no obstruction
		#   "Invalid Input": if input is invalid
		#}

		#identify smaller and higher x and y position 
		small_x,small_y,high_x,high_y = start_x,start_y,dest_x,dest_y
		if start_x > dest_x; small_x,high_x = dest_x,start_x end
		if start_y > dest_y; small_y,high_y = dest_y,start_y end
		
		puts "start_x:" + start_x.to_s
		puts "start_y:" + start_y.to_s
		puts "dest_x:" + dest_x.to_s
		puts "dest_y:" + dest_y.to_s

		if small_x == high_x
			#check for vertical obstruction
			puts "Horizontal"
			(high_y-small_y-1).abs.times do |i|
				puts "i:" + i.to_s
				move = Piece.where("x_position = '#{small_x}' AND y_position = '#{small_y+i+1}' AND game_id = '#{current_game.id} '").first
				if !move.nil?
					return true
				end 
			end	
		elsif small_y == high_y
			#check for horizontal obstruction
			puts "Vertical"
			(high_x-small_x-1).abs.times do |i|
				#puts "i:" + i.to_s
				#puts current_game.id
				move = Piece.where("x_position = '#{small_x+i+1}' AND y_position = '#{small_y}' AND game_id = '#{current_game.id} '").first
				#puts move.id
				if !move.nil?
					return true
				end 
			end
		elsif (high_x-small_x).abs == (high_y-small_y).abs
			#check for diagonal obstruction
			#puts "Diagonal"
			
			(high_x-small_x-1).abs.times do |i|
				#puts "i:" + i.to_s + " current_game: "+ current_game.id.to_s
				i_x, i_y = i+1,i+1
				if dest_x < start_x
					i_x = -1 * i_x
				end
				if dest_y <start_y
					i_y = -1 * i_y
				end

				move = Piece.where("x_position = '#{i_x+start_x}' AND y_position = '#{i_y+start_y}' AND game_id = '#{current_game.id} '").first
				if !move.nil?
					return true
				end 
			end
		else
			return "Invalid Input"
		end
		#there is no obstruction 
		return false
	end

	def capturepieceSection(piece_moved)
		@game = Game.find_by_id(piece_moved.game_id)
		if !@game.black_player_id.nil? 
			@black_player = User.find(@game.black_player_id)
		else
			@black_player = nil
		end
		@white_player = User.find(@game.white_player_id)
		htmltext = '<div class="black-player-zone">'
		htmltext << '<span>Black Player:' 
		if !@black_player.nil?
		  htmltext << @black_player.email 
		  if @black_player == current_user
			htmltext << view_context.link_to("Forfeit", game_path(@game, forfeit:0),:method => :put, class: 'btn btn-primary') 
		  end
		end
		htmltext << '</span>'
		htmltext << '<div>'
		@pieces_captured = @game.pieces.where('captured = ? AND piece_color = ?',true,"black")
		htmltext <<	'<div>'
		@pieces_captured.each do |piece| 
			htmltext << view.context.image_tag(piece.image_url, class: 'img-fluid ',style: "height:40px;width:40px")
		end
		htmltext << '</div>'
		htmltext << '</div>'
		htmltext << '</div>'
		htmltext << '<p></p>'
		htmltext << '<div class="white-player-zone">'
		htmltext << '<span>White Player:' 
		if !@white_player.nil? 
			htmltext << @white_player.email 
			if @white_player== current_user
				htmltext << view_context.link_to("Forfeit", game_path(@game, forfeit:0),:method => :put, class: 'btn btn-primary') 
			end
		end
		htmltext << '</span>'
		htmltext << '<div>'
		@pieces_captured = @game.pieces.where('captured = ? AND piece_color = ?',true,"white")
		htmltext << '<div>'
		@pieces_captured.each do |piece|
			htmltext << view_context.image_tag(piece.image_url, class: 'img-fluid ',style: "height:40px;width:40px")
		end
		htmltext << '</div>'
		htmltext << '</div>'
		htmltext << '<div>'  
		return htmltext

	end
	def current_game
		@current_game ||= Game.find(params[:game_id])
	end
end
