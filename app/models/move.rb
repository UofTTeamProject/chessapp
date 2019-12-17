class Move < ApplicationRecord
    belongs_to :game
    belongs_to :piece
    #validates :current_position, if: self.piece.valid_move?(:previous_position,:current_position) 
    validates_associated :piece
end
