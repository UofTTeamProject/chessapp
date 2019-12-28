class Knight < Piece
    
    validate :is_validmove?, on: :update
    
    def is_validmove?
      dest_x,dest_y = self.x_position.to_i,self.y_position.to_i
      previous_piece_move = Piece.find(self.id)
      start_x,start_y = previous_piece_move.x_position.to_i,previous_piece_move.y_position.to_i
      
      return ((long_move?(start_x, dest_x) && short_move?(start_y, dest_y)) || 
      (long_move?(start_y, dest_y) && short_move?(start_y, dest_x)))
    end

    private

    def long_move?(start, ending)
      return (start - ending).abs == 2
    end

    def short_move?(start, ending)
      return (start -ending).abs == 1
    end
end
