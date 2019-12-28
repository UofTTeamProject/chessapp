class Rook < Piece

  validate :is_validmove?, on: :update

  def is_validmove?
    piece = Piece.find(self.id)
    previous_x,previous_y= piece.x_position,piece.y_position
    #puts "#{self.x_position} #{self.y_position} #{previous_x} #{previous_y}"
    unless only_x_change?(previous_x,previous_y)  || only_y_change?(previous_x,previous_y)
      errors[:piece_type] << "Invalid Rook Move"
      return false
    end
  end

  def only_y_change?(previous_x,previous_y)
    return (self.y_position != previous_y && self.x_position == previous_x)
  end

  def only_x_change?(previous_x,previous_y)
    return (self.x_position != previous_x && self.y_position == previous_y)
  end


end