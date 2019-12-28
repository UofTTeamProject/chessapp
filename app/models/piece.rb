class Piece < ApplicationRecord

  belongs_to :game
  has_many :moves
    #main base class
  def move_to(new_x, new_y)
    captured_piece = Piece.where(game_id: self.game_id, x_position: new_x, y_position: new_y, captured:false).where.not(id:self.id)
    puts "Hello Count "+ captured_piece.count.to_s 
    #print captured_piece.id.to_s + " " + captured_piece.piece_color + " " +self.piece_color
    if (captured_piece.first && captured_piece.first.piece_color != self.piece_color) || !captured_piece.first
      puts "Hello"
      self.previous_x_pos = self.x_position
      self.previous_y_pos = self.y_position
      self.x_position = new_x
      self.y_position = new_y

      if self.save 
        if self.type=="Pawn" && ((self.x_position==6 && self.piece_color=="white") || (self.x_position==3 && self.piece_color=="black"))
          #self.check_Enpassant
        end
        
        if captured_piece.first 
          captured_piece.first.captured = true
          captured_piece.first.save(:validate => false)
        end
        return true
      end
    end
    return false

  end

  def check_Enpassant
    puts "Hello enpassant move"
    if self.piece_color=="black" && self.x_position==3
      enpassant_x =4
      enpassant_prev_x=2
      enpassant_piece_color = "white"
    elsif self.piece_color == "white" && self.x_position==6
      enpassant_x =5
      enpassant_prev_x=7
      enpassant_piece_color = "black"
    end
    enpassant_y =self.y_position
    enpassant_prev_y=self.y_position
    enpassant_piece = Piece.where(game_id: self.game_id, x_position: enpassant_x, y_position: enpassant_y, captured:false, piece_color:enpassant_piece_color,previous_x_pos:enpassant_prev_x,previous_y_pos:enpassant_prev_y).first
    if !enpassant_piece.blank?
      puts "update piece"
      enpassant_piece.captured=true
      enpassant_piece.save(:validate => false)
    end
  end
	
end





