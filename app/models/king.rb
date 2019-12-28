class King < Piece

    validate :is_validmove?, on: :update
    def is_validmove?
        dest_x,dest_y = self.x_position,self.y_position
        previous_piece_move = Piece.find(self.id)
        start_x,start_y = previous_piece_move.x_position,previous_piece_move.y_position
        
        #puts "Start_x: "+ start_x.to_s
        #puts "Start_y: "+ start_y.to_s
        #puts "Dest_x: "+ dest_x.to_s
        #puts "Dest_y: "+ dest_y.to_s 
        if (start_x.to_i - dest_x.to_i).abs <=1 && (start_y.to_i - dest_y.to_i).abs <=1 
            return true
        else
            errors[:x_position] << "Not a valid Move"
            return false
        end
    end
end
