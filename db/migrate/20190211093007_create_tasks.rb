class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.string :status, default: false
      t.datetime :deadline
      t.boolean :pinned, default: false
      t.integer :claimer
      t.integer :completer
      t.integer :user_id

      t.timestamps
    end
  end
end
