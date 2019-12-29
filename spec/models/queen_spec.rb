require 'rails_helper'

RSpec.describe Queen, type: :model do
	describe "Queen#update" do
        it "successfully updates record when Queen is moved to correct location" do
            #dummy game ,user1 ,user2 and Queen piece creation
            user1 = FactoryBot.create(:user)
            user2 = FactoryBot.create(:user)
            game = Game.create(white_player_id:user1.id,black_player_id:user2.id,status:-1)
            piece = Piece.create(piece_type:"Queen",piece_color:"white",type:"Queen",x_position:1,y_position:4)
            move = Piece.find(piece.id).update_attributes(x_position:5,y_position:4) #for vertical movement
            expect(move).to eq(true)
            #for horizontal movement
            piece = Piece.create(piece_type:"Queen",piece_color:"white",type:"Queen",x_position:1,y_position:4)
            move = Piece.find(piece.id).update_attributes(x_position:1,y_position:6)
            expect(move).to eq(true)
            #for diagonal movement
            piece = Piece.create(piece_type:"Queen",piece_color:"white",type:"Queen",x_position:1,y_position:4)
            move = Piece.find(piece.id).update_attributes(x_position:3,y_position:6)
            expect(move).to eq(true)
        end
        
        it "returns a error when a Queen piece is  moved to wrong/invalid location" do
            #dummy game ,user1 ,user2 and Bishop piece creation
            user1 = FactoryBot.create(:user)
            user2 = FactoryBot.create(:user)
            game = Game.create(white_player_id:user1.id,black_player_id:user2.id,status:-1)
            piece = Piece.create(piece_type:"Queen",piece_color:"white",type:"Queen",x_position:2,y_position:2)
            move = Piece.find(piece.id).update_attributes(x_position:4,y_position:1)
            expect(move).to eq(false)
        end
    end
  
end
