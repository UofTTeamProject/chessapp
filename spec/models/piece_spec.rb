require 'rails_helper'

RSpec.describe Piece, type: :model do
  describe "Piece#move_to" do
    it "moves a piece to an empty square" do
      piece = FactoryBot.create(:piece)
      #puts piece.game_id
      expect(piece.x_position).to eq(0)
      expect(piece.y_position). to eq(0)
      piece.move_to(1, 1)
      piece.reload
      expect(piece.x_position).to eq(1)
      expect(piece.y_position).to eq(1)
    end

    it "captures a piece that was at the space it's moving to" do
      piece_1 = FactoryBot.create(:piece)
      piece_2 = FactoryBot.create(:piece, piece_color: "black", game: piece_1.game, x_position: 2, y_position: 2)
      #print piece_2.piece_color
      piece_1.move_to(2, 2)
      piece_1.reload
      piece_2.reload
      expect(piece_1.x_position).to eq(2)
      expect(piece_1.y_position).to eq(2)
      expect(piece_2.captured).to be true
    end

    it "does not capture a piece that was at the sapce it's moving to of the same color" do
      piece_1 = FactoryBot.create(:piece)
      piece_2 = FactoryBot.create(:piece, piece_color: piece_1.piece_color, game: piece_1.game, x_position: 1, y_position: 1)
      piece_1.move_to(1, 1)
      piece_1.reload
      piece_2.reload
      expect(piece_1.x_position).to eq(0)
      expect(piece_1.y_position).to eq(0)
      expect(piece_2.captured).to be false
    end


    it "does not capture a piece that was at the space it's moving to if that piece belongs to another game" do
      piece_1 = FactoryBot.create(:piece)
      piece_2 = FactoryBot.create(:piece, piece_color: piece_1.piece_color, x_position: 1, y_position: 1)
      piece_1.move_to(1, 1)
      piece_1.reload
      piece_2.reload
      expect(piece_1.x_position).to eq(1)
      expect(piece_1.y_position).to eq(1)
      expect(piece_2.captured).to be false
    end



    # it "does not capture a piece that was at the space it's moving to if that piece belongs to another game" do
    #   #make sure the piece does move, but does not capture pieces from other games with the new_x and new_y positions 
    # end

  end
end
