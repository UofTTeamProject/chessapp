
class GamesController < ApplicationController
	def index
		
	end

	def new

	end

	def create

	end
	
	def show
		puts is_Obstructed?(4,1,3,5)
	end

	def update

	end

	private

	def is_Obstructed?(start_x,start_y,dest_x,dest_y)
		
		#identify smaller and higher x and y position 
		small_x,small_y,high_x,high_y = start_x,start_y,dest_x,dest_y
		if start_x > dest_x; small_x,high_x = dest_x,start_x end
		if start_y > dest_y; small_y,high_y = dest_y,start_y end
		
		puts "small_x:" + small_x.to_s
		puts "small_y:" + small_y.to_s
		puts "high_x:" + high_x.to_s
		puts "high_y:" + high_y.to_s

		if small_x == high_x
			#check for vertical obstruction
			puts "Horizontal"
			for i in small_y..(high_y-1) do
				puts "i:" + i.to_s
				move = current_game.moves.where("current_position = '#{small_x}*#{i+1}'").order('created_at DESC').first
				if !move.nil?
					return true
				end 
			end	
		elsif small_y == high_y
			#check for horizontal obstruction
			puts "Vertical"
			for i in small_x..(high_x-1) do
				puts "i:" + i.to_s
				move = current_game.moves.where("current_position = '#{i+1}*#{small_y}'").order('created_at DESC').first
				if !move.nil?
					return true
				end 
			end
		elsif (high_x-small_x) == (high_y-small_y)
			#check for diagonal obstruction
			puts "Diagonal"
			(high_x-small_x-1).abs.times do |i|
				puts "i:" + i.to_s
				move = current_game.moves.where("current_position = '#{i+small_x+1}*#{i+small_y+1}'").order('created_at DESC').first
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

	def current_game
		@current_game ||= Game.find(params[:id])
	end
end
