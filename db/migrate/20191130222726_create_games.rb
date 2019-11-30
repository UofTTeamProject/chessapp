
class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :white_player_id
      t.integer :black_player_id
      t.integer :status
      t.timestamps
    end
  end
end
