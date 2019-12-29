require 'rails_helper'

RSpec.describe Knight, type: :model do
    describe "is_valid_move?" do

      before(:each) do
        user1 = FactoryBot.create(:user)
        user2 = FactoryBot.create(:user)
        @game = Game.create(white_player_id: user1.id,
          black_player_id: user2.id,
          status:-1)
      end

      it "is valid if it moved 2 up and 1 sideways" do
        knight = FactoryBot.create(:knight,
          game: @game,
          x_position: 1,
          y_position: 1)
        expect(knight.is_valid_move?(2, 3)).to be true
      end

      it "is valid if it moved 2 sideways and 1 up" do
        knight = FactoryBot.create(:knight,
          game: @game,
          x_position: 1,
          y_position: 1)
        expect(knight.is_valid_move?(3, 2)).to be true
      end

      it "is invalid if it moved 2 sideways and 2 up" do
        knight = FactoryBot.create(:knight,
          game: @game,
          x_position: 1,
          y_position: 1)
        expect(knight.is_valid_move?(3, 3)).to be false
      end  

      it "is invalid if it moved 1 sideways and 1 up" do
        knight = FactoryBot.create(:knight,
          game: @game,
          x_position: 1,
          y_position: 1)
        expect(knight.is_valid_move?(2, 2)).to be false
      end 
    end
end
