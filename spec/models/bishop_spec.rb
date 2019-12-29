require 'rails_helper'

RSpec.describe Bishop, type: :model do
  
    describe "Bishop#update" do
        it "successfully updates record when Bishop is moved to correct location" do
            #dummy game ,user1 ,user2 and Bishop piece creation
            user1 = FactoryBot.create(:user)
            user2 = FactoryBot.create(:user)
            game = Game.create(white_player_id:user1.id,black_player_id:user2.id,status:-1)
            piece = Piece.create(piece_type:"Bishop",piece_color:"white",type:"Bishop",x_position:2,y_position:2)
            move = Piece.find(piece.id).update_attributes(x_position:5,y_position:5)
            expect(move).to eq(true)
        end
        it "returns a error when a Bishop piece is  moved to wrong/invalid location" do
            #dummy game ,user1 ,user2 and Bishop piece creation
            user1 = FactoryBot.create(:user)
            user2 = FactoryBot.create(:user)
            game = Game.create(white_player_id:user1.id,black_player_id:user2.id,status:-1)
            piece = Piece.create(piece_type:"Bishop",piece_color:"white",type:"Bishop",x_position:2,y_position:2)
            move = Piece.find(piece.id).update_attributes(x_position:2,y_position:3)
            expect(move).to eq(false)
        end
    end
end


