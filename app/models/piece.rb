class Piece < ApplicationRecord
  def move_to(new_x, new_y)
    #Look up in in the database, if there is another piece for this piece's game, at the new x and y positions
    #if there is, and it's a different color than this piece, capture it and set this piece's position to new_x and new_y
    #if there is, but it's not a different color, then do nothing
    #if there is not piece there, set this piece's psoitions to the new_x and new_y
  end
end
