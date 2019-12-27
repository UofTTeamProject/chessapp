class Piece < ApplicationRecord

  belongs_to :game
  has_many :moves
    #main base class
  def move_to(new_x, new_y)
    captured_piece = Piece.where(game_id: self.game_id, x_position: new_x, y_position: new_y, captured:false).where.not(id:self.id)
    captured_piece.each do |temp|
      puts temp.id.to_s
    end
    #print captured_piece.id.to_s + " " + captured_piece.piece_color + " " +self.piece_color
    if captured_piece.first && captured_piece.first.piece_color != self.piece_color
      captured_piece.first.update_attributes(captured: true)
    end
    self.x_position = new_x
    self.y_position = new_y
    return self.save
    
  end
	
end





