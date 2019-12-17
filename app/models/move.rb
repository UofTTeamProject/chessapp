class Move < ApplicationRecord
    belongs_to :game
  
  def move_to(new_x, new_y)
    #Look up in in the database, if there is another piece for this piece's game, at the new x and y positions
    #if there is, and it's a different color than this piece, capture it and set this piece's position to new_x and new_y
    #if there is, but it's not a different color, then do nothing
    #if there is not piece there, set this piece's psoitions to the new_x and new_y
  end    

    belongs_to :piece
    validate :check_validmove
    #validates :current_position, if: self.piece.valid_move?(:previous_position,:current_position) 
    #validates_associated :piece
    def check_validmove
        unless self.piece.valid_move(self.current_position,self.previous_position) == true
            errors[:current_position] << "Not a valid Move"
            return false
        end  
    end

end
