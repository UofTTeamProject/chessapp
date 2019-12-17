class Move < ApplicationRecord
    #belongs_to :game
    #belongs_to :piece
    #validate :check_validmove
    #validates :current_position, if: self.piece.valid_move?(:previous_position,:current_position) 
    #validates_associated :piece
    #def check_validmove
    #    unless self.piece.valid_move(self.current_position,self.previous_position) == true
    #        errors[:current_position] << "Not a valid Move"
    #        return false
    #    end  
    #end
end
