class RemoveTimeFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :time
  end
end
