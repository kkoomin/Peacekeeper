class CreatePlayerTable < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :result, default: 0
      t.integer :dice_id
    end
  end
end
