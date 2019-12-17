class King < Piece
    

    def valid_move?(current_position,previous_position)
        start_x,start_y = self.moves.first.previous_position.split("*")
        dest_x,dest_y = self.moves.first.current_position.split("*")

        if (start_x.to_i - dest_x.to_i).abs <=1 && (start_y.to_i - dest_y.to_i).abs <=1 
            return true
        else
            errors.add_to_base("Invalid Move")
        end
    end
end
