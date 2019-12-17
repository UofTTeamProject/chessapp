require 'rails_helper'

RSpec.describe Piece, type: :model do
  describe "Piece#move_to" do
    # it "moves a piece to an empty square" do
    #   piece = FactoryBot.create(:piece)
    #   expect(piece.x_position).to eq(0)
    #   expect(piece.y_position). to eq(0)
    #   piece.move_to(1, 1)
    #   piece.reload
    #   expect(piece.x_position).to eq(1)
    #   expect(piece.y_position).to eq(1)
    # end

    # it "captures a piece that was at the space it's moving to" do
    # end

    # it "does not capture a piece that was at the sapce it's moving to of the same color" do
    #   #make sure the piece does not move
    # end

    # it "does not capture a piece that was at the space it's moving to if that piece belongs to another game" do
    #   #make sure the piece does move, but does not capture pieces from other games with the new_x and new_y positions 
    # end
  end
end
