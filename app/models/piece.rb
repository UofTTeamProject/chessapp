class Piece < ApplicationRecord
    #main base class
    has_many :moves
    validate :is_validmove? , on: :update

    def is_validmove?
        true
    end


end





