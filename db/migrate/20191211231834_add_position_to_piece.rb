class AddPositionToPiece < ActiveRecord::Migration[5.2]
  def change
    add_column :pieces, :x_position, :integer
    add_column :pieces, :y_position, :integer
  end
end
