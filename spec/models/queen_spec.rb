require 'rails_helper'

RSpec.describe Queen, type: :model do
    
    before(:each) do
        user1 = FactoryBot.create(:user)
        user2 = FactoryBot.create(:user)
        @game = Game.create(white_player_id: user1.id,
          black_player_id: user2.id,
          status:-1)
    end
    
    describe "Queen#update" do
        it "successfully updates record when Queen is moved to correct location" do
            #dummy game ,user1 ,user2 and Queen piece creation
            
            piece = FactoryBot.create(:queen,game:@game,x_position:3,y_position:3)
            
            move = piece.move_to(5,3) #for vertical movement
            expect(move).to eq(true)
            #for horizontal movement
            
            move = piece.move_to(5,5)
            expect(move).to eq(true)
            
            #for diagonal movement
            move = piece.move_to(3,3)
            expect(move).to eq(true)
            
        end
        
        it "returns a error when a Queen piece is  moved to wrong/invalid location" do
            #dummy game ,user1 ,user2 and Bishop piece creation
            piece = FactoryBot.create(:queen,game:@game,x_position:3,y_position:3)
            move = piece.move_to(4,1)
            expect(move).to eq(false)
        end
    end
  
end
