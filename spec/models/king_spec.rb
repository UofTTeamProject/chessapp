require 'rails_helper'

RSpec.describe King, type: :model do
    describe "King#update" do
        it "successfully updates record when King is moved to correct location" do
            #dummy game ,user1 ,user2 and King piece creation
            user1 = FactoryBot.create(:user)
            user2 = FactoryBot.create(:user)
            game = Game.create(white_player_id: user1.id,
                black_player_id: user2.id,
                status:-1)
            king = FactoryBot.create(:king, game: game, x_position: 1, y_position: 1)
            expect(king.is_valid_move?(2, 2)).to be true
        end
        it "returns a error when a king piece is  moved to wrong/invalid location" do
            #dummy game ,user1 ,user2 and King piece creation
            user1 = FactoryBot.create(:user)
            user2 = FactoryBot.create(:user)
            game = Game.create(white_player_id: user1.id,
                black_player_id: user2.id,
                status:-1)
            king = FactoryBot.create(:king, game: game, x_position: 1, y_position: 1)
            expect(king.is_valid_move?(2, 3)).to be false
        end
    end
end
