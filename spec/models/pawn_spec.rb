require 'rails_helper'

RSpec.describe Pawn, type: :model do
    
    before(:each) do
        user1 = FactoryBot.create(:user)
        user2 = FactoryBot.create(:user)
        @game = Game.create(white_player_id: user1.id,
          black_player_id: user2.id,
          status:-1)
    end
    describe "Pawn#update" do
        it "should return true if pawn is moved 1/2 position vertically" do
            piece = FactoryBot.create(:pawn,game:@game,x_position:3,y_position:3,piece_color:"white")
            #puts piece.piece_color
            move = piece.move_to(4,3)
            expect(move).to equal(true)
        end
    end
end
