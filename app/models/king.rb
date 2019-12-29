class King < Piece

    def is_valid_move?(new_x, new_y)
        return (x_position - new_x).abs <= 1 && (y_position - new_y).abs <=1
    end
end
