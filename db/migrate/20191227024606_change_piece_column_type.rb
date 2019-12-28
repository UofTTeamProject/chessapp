class ChangePieceColumnType < ActiveRecord::Migration[5.2]
  def change
    change_column :pieces, :previous_x_pos, 'integer USING CAST(previous_x_pos AS integer)'
  end
end
