require 'rails_helper'

RSpec.describe King, type: :model do
    describe "King#update" do
        it "successfully updates record when King is moved to correct location" do
            #dummy game ,user1 ,user2 and King piece creation
            user1 = FactoryBot.create(:user)
            user2 = FactoryBot.create(:user)
            game = Game.create(white_player_id:user1.id,black_player_id:user2.id,status:-1)
            piece = game.pieces.create(piece_type:"King",piece_color:"white",type:"King",x_position:1,y_position:1)
            move = game.pieces.find(piece.id).update_attributes(x_position:2,y_position:2)
            expect(move).to eq(true)
        end
        it "returns a error when a king piece is  moved to wrong/invalid location" do
            #dummy game ,user1 ,user2 and King piece creation
            user1 = FactoryBot.create(:user)
            user2 = FactoryBot.create(:user)
            game = Game.create(white_player_id:user1.id,black_player_id:user2.id,status:-1)
            piece = game.pieces.create(piece_type:"King",piece_color:"white",type:"King",x_position:1,y_position:1)

            move = game.pieces.find(piece.id).update_attributes(x_position:2,y_position:3)
            expect(move).to eq(false)
        end
    end
end
