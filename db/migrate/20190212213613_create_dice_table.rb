class CreateDiceTable < ActiveRecord::Migration[5.2]
  def change
    create_table :dices do |t|
      t.string :title
    end
  end
end
