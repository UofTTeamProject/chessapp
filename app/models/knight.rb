class Knight < Piece
    def is_valid_move?(new_x, new_y)
      return ((long_move?(x_position, new_x) && short_move?(y_position, new_y)) || 
      (long_move?(y_position, new_y) && short_move?(x_position, new_x)))
    end


    private

    def long_move?(start, ending)
      return (start - ending).abs == 2
    end

    def short_move?(start, ending)
      return (start -ending).abs == 1
    end
end
