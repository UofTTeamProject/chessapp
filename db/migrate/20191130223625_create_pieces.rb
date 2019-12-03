class CreatePieces < ActiveRecord::Migration[5.2]
  def change
    create_table :pieces do |t|
      t.string :piece_type
      t.string :piece_color
      t.string :starting_position
      t.text :image_url
      t.timestamps
    end
  end
end
