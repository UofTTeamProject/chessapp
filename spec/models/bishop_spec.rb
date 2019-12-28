require 'rails_helper'

RSpec.describe Bishop, type: :model do
  
    before(:each) do
        user1 = FactoryBot.create(:user)
        user2 = FactoryBot.create(:user)
        @game = Game.create(white_player_id: user1.id,
          black_player_id: user2.id,
          status:-1)
    end

    describe "Bishop#update" do
        it "successfully updates record when Bishop is moved to correct location" do
            #dummy game ,user1 ,user2 and Bishop piece creation
            
            piece = FactoryBot.create(:bishop,game:@game,x_position:3,y_position:3)
            move = piece.move_to(5,5)
            expect(move).to eq(true)
        end
        it "returns a error when a Bishop piece is  moved to wrong/invalid location" do
            #dummy game ,user1 ,user2 and Bishop piece creation
            piece = FactoryBot.create(:bishop,game:@game,x_position:3,y_position:3)
            move = piece.move_to(3,4)
            expect(move).to eq(false)
        end
    end
end


