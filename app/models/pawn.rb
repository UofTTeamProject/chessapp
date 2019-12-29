class Pawn < Piece
    validate :is_validmove?, on: :update

    def is_validmove?
        dest_x,dest_y = self.x_position.to_i,self.y_position.to_i
        previous_piece_move = Piece.find(self.id)
        start_x,start_y = previous_piece_move.x_position.to_i,previous_piece_move.y_position.to_i
        
        puts "Start_x: "+ start_x.to_s
        puts "Start_y: "+ start_y.to_s
        puts "Dest_x: "+ dest_x.to_s
        puts "Dest_y: "+ dest_y.to_s 
        if (previous_piece_move.piece_color== "white" && dest_x-start_x >= 1) || (previous_piece_move.piece_color== "black" && dest_x-start_x <= -1)
            if start_y == dest_y
                puts "check for vertical move 1"
                if (start_x-dest_x).abs <= 2
                    puts "check for vertical move 2"
                    if ((start_x-dest_x).abs ==2 && (start_x==2 || start_x==7)) || (start_x-dest_x).abs ==1 || (start_x-dest_x).abs == 0
                        puts "check for vertical move 3"
                        return true
                    else
                        puts "check for vertical move 4"
                        errors[:x_position] << "Not a valid Move. Pawn can not move beyond 1 move after initial move"     
                        return false
                    end
                else
                    puts "check for vertical move 5"
                    errors[:x_position] << "Not a valid Move. Pawn can not move beyond 1/2 move"
                    return false
                end 
            elsif (start_y - dest_y).abs == 1
                puts "check for vertical move 6"
                #check for diagonal move
                if (start_x - dest_x).abs == 1
                    puts "check for vertical move 7"
                    return true
                else
                    puts "check for vertical move 8"
                    errors[:x_position] << "Not a valid Move. Pawn can not move beyond 1 move while capturing another piece"
                    return false
                end
            else
                puts "check for vertical move 9"
                errors[:x_position] << "Not a valid Move. Pawn can only move straight or diagonally one step while capturing another piece"
                return false
            end
        end
        #puts "check for vertical move 10"
        
        errors[:x_position] << "Not a valid Move. Pawn can not move backward"
        return false
    
    end
end
