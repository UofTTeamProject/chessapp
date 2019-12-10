
class GamesController < ApplicationController
	def index
		
	end

	def new

	end

	def create

	end
	
	def show
		puts is_Obstructed(1,1,2,2)
	end

	def update

	end

	private

	def is_Obstructed?(start_x,start_y,dest_x,dest_y)
		
		#identify smaller and higher x and y position 
		small_x,small_y,high_x,high_y = start_x,start_y,dest_x,dest_y
		if start_x > dest_x; small_x,high_x = dest_x,start_x end
		if start_y > dest_y; small_y,high_y = dest_y,start_y end
		
		
		if small_x == high_x
			#check for vertical obstruction
			for i in small_y..(high_y-1) do
				move = current_game.moves.where("current_position = '#{small_x}*#{i+1}'").order('created_at DESC').first
				if move.nil?
					return true
				end 
			end	
		elsif small_y == high_y
			#check for horizontal obstruction
			for i in small_x..(high_x-1) do
				move = current_game.moves.where("current_position = '#{i+1}*#{small_x}'").order('created_at DESC').first
				if move.nil?
					return true
				end 
			end
		elsif (high_x-small_x) == (high_y-small_y)
			#check for diagonal obstruction
			for i in 0..(high_x-small_x-1).abs do
				move = current_game.moves.where("current_position = '#{i+small_x+1}*#{i+small_y+1}'").order('created_at DESC').first
				if move.nil?
					return true
				end 
			end
		else
			return true
		end
		return false
	end

	def current_game
		@current_game ||= Game.find(params[:id])
	end
end
