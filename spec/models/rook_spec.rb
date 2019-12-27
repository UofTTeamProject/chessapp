require 'rails_helper'

RSpec.describe Rook, type: :model do
    describe "is_valid_move?" do

      before(:each) do
        user1 = FactoryBot.create(:user)
        user2 = FactoryBot.create(:user)
        @game = Game.create(white_player_id: user1.id,
          black_player_id: user2.id,
          status:-1)
      end

      it "is valid if it moved vertically only" do
        rook = FactoryBot.create(:rook,
          game: @game,
          x_position: 1,
          y_position: 1)
        expect(rook.is_valid_move?(1, 2)).to be true
      end

      it "is valid if it moved horizontally only" do
        rook = FactoryBot.create(:rook,
          game: @game,
          x_position: 1,
          y_position: 1)
        expect(rook.is_valid_move?(2, 1)).to be true
      end

      it "is invalid if it moved both vert and horz" do
        rook = FactoryBot.create(:rook,
          game: @game,
          x_position: 1,
          y_position: 1)
        expect(rook.is_valid_move?(2, 2)).to be false
      end
    end  
end
