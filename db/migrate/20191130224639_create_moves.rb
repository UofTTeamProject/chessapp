class CreateMoves < ActiveRecord::Migration[5.2]
  def change
    create_table :moves do |t|
      t.integer :piece_id
      t.integer :player_id
      t.integer :game_id
      t.string :previous_position
      t.string :current_position
      t.timestamps
    end
    add_index :moves, [:piece_id,:player_id,:game_id]
    add_index :moves, [:player_id, :game_id]
    add_index :moves, :game_id
  end
end
