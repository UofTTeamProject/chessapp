class Piece < ApplicationRecord
	#belongs_to :game
	#has_many :moves
  #main base class
end

class Pawn < Piece
end

class Knight < Piece
end

class Bishop < Piece
end

class Rook < Piece


  belongs_to :game
  has_many :moves
    #main base class
  def move_to(new_x, new_y)
    captured_piece = Piece.where(game_id: self.game_id, x_position: new_x, y_position: new_y, captured:false).where.not(id:self.id)
    puts "Hello Count " +captured_piece.count.to_s
    #print captured_piece.id.to_s + " " + captured_piece.piece_color + " " +self.piece_color
    if (captured_piece.first && captured_piece.first.piece_color != self.piece_color) || !captured_piece.first
      self.x_position = new_x
      self.y_position = new_y
      if self.save 
        if captured_piece.first 
          captured_piece.first.captured = true
          captured_piece.first.save(:validate => false)
        end
        return true
      end
    
    else
      return false
    end

  end

end





