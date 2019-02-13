class AddPlayerNumberToDice < ActiveRecord::Migration[5.2]
  def change
    add_column :dices, :num_of_players, :integer, default: 0
  end
end
