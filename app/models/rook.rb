class Rook < Piece


   def is_valid_move?(new_x, new_y)
    return only_y_change?(new_x, new_y) || only_x_change?(new_x, new_y)
   end

   private

   def only_y_change?(new_x, new_y) 
     return y_position != new_y && x_position == new_x
   end

   def only_x_change?(new_x, new_y)
     return x_position != new_x && y_position == new_y
   end
end