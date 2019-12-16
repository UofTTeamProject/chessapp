require 'rails_helper'

RSpec.describe Move, type: :model do
    describe "Move#create" do
        it "successfully creates record when King is moved to correct location" do
            #dummy game ,user1 ,user2 and King piece creation
            user1 = FactoryBot.create(:user)
            user2 = FactoryBot.create(:user)
            game = Game.create(white_player_id:user1.id,black_player_id:user2.id,status:-1)
            piece = Piece.create(piece_type:"King",piece_color:"white",starting_position:"1*1",type:"King")

            move = Move.create(piece_id:piece.id,player_id:user1.id,game_id:game.id,previous_position:piece.starting_position,current_position:"2*2")
            expect(move.valid?).to eq(true)
        end
        it "returns a error when a king piece is being moved to wrong/invalid location" do
            #dummy game ,user1 ,user2 and King piece creation
            user1 = FactoryBot.create(:user)
            user2 = FactoryBot.create(:user)
            game = Game.create(white_player_id:user1.id,black_player_id:user2.id,status:-1)
            piece = Piece.create(piece_type:"King",piece_color:"white",starting_position:"1*1",type:"King")

            move = Move.create(piece_id:piece.id,player_id:user1.id,game_id:game.id,previous_position:piece.starting_position,current_position:"2*3")
            expect(move.valid?).to eq(false)
        end
    end
end
