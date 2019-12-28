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
        puts self.piece_color 
        if (previous_piece_move.piece_color== "white" && dest_x-start_x >= 1) || (previous_piece_move.piece_color== "black" && dest_x-start_x <= -1)
            puts "Pawn moved forward"
            if start_y == dest_y
                puts "Vertical move"
                if (start_x-dest_x).abs <= 2
                    puts "vertical move by 2 position"
                    if ((start_x-dest_x).abs ==2 && (start_x==2 || start_x==7)) || (start_x-dest_x).abs ==1 || (start_x-dest_x).abs == 0
                        puts "move by 2 position only from starting position, move by one position otherwise"
                        return true
                    else
                        errors[:x_position] << "Not a valid Move. Pawn can not move beyond 1 move after initial move"     
                        return false
                    end
                else
                    puts "Not Allowed to move beyond 2 positions"
                    errors[:x_position] << "Not a valid Move. Pawn can not move beyond 1/2 move"
                    return false
                end 
            elsif (start_y - dest_y).abs == 1
                puts "horizontal move"
                piece_at_dest = Piece.where("game_id = ? AND piece_color = ? AND x_position = ? AND y_position = ? AND captured = false ",self.game_id,self.piece_color == "white"? "black" : "white", dest_x,dest_y).first
                if (start_x - dest_x).abs == 1 && !piece_at_dest.blank?
                    puts "horizontal move accompanied by vertical move == diagonal move and it is a capture move"
                    return true
                elsif (start_x - dest_x).abs == 1 && piece_at_dest.blank?
                    puts "Check for possibility of en passant move"
                    self.check_Enpassant
                    return true 
                else
                    errors[:x_position] << "Not a valid Move. Pawn can not move beyond 1 move while capturing another piece"
                    return false
                end
            else
                puts "check for vertical move 9"
                errors[:x_position] << "Not a valid Move. Pawn can only move straight or diagonally one step while capturing another piece"
                return false
            end
        end
        puts "check for vertical move 10"
        
        errors[:x_position] << "Not a valid Move. Pawn can not move backward"
        return false
    
    end

    def check_Enpassant
        puts "Hello enpassant move"
        if self.piece_color=="black" && self.x_position==3
          enpassant_x =4
          enpassant_prev_x=2
          enpassant_piece_color = "white"
        elsif self.piece_color == "white" && self.x_position==6
          enpassant_x =5
          enpassant_prev_x=7
          enpassant_piece_color = "black"
        end
        enpassant_y =self.y_position
        enpassant_prev_y=self.y_position
        enpassant_piece = Piece.where(game_id: self.game_id, x_position: enpassant_x, y_position: enpassant_y, captured:false, piece_color:enpassant_piece_color,previous_x_pos:enpassant_prev_x,previous_y_pos:enpassant_prev_y).first
        if !enpassant_piece.blank?
          puts "update piece"
          enpassant_piece.captured=true
          enpassant_piece.save(:validate => false)
        end
    end


end
