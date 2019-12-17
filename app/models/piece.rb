class Piece < ApplicationRecord

    #main base class
    #validate :valid_move?
    has_many :moves

end





