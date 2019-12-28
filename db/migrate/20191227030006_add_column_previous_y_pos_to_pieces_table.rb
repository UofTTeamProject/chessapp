class AddColumnPreviousYPosToPiecesTable < ActiveRecord::Migration[5.2]
  def change
    add_column :pieces, :previous_y_pos, :integer
  end
end
