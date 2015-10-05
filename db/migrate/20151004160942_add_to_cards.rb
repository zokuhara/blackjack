class AddToCards < ActiveRecord::Migration
  def change
    change_table :cards do |t|
      t.integer :position
      t.string :suit
      t.string :name
      t.integer :value
      t.integer :game_id
      t.integer :hand_id
    end
  end
end
