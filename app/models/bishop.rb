class Bishop < Piece
    validate :is_validmove?, on: :update

    def is_validmove?
        dest_x,dest_y = self.x_position,self.y_position
        previous_piece_move = Piece.find(self.id)
        start_x,start_y = previous_piece_move.x_position,previous_piece_move.y_position
        if (start_x.to_i - dest_x.to_i).abs == (start_y.to_i - dest_y.to_i).abs
            return true
        else
            errors[:x_position] << "Not a valid Move"
            return false
        end
    end
end

