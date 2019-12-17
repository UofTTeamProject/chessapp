class Piece < ApplicationRecord

  belongs_to :game
    #main base class
  def move_to(new_x, new_y)
    captured_piece = Piece.where(game_id: self.game_id, x_position: new_x, y_position: new_y).first
    if !captured_piece || captured_piece.piece_color != self.piece_color
      captured_piece.update(captured: true) if captured_piece
      self.x_position = new_x
      self.y_position = new_y
      self.save
    end
  end
end

class Pawn < Piece

    #main base class
    has_many :moves

end





