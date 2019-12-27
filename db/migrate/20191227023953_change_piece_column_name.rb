class ChangePieceColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :pieces, :starting_position, :previous_x_pos
  end
end
