class AddIndexToPosts < ActiveRecord::Migration
  def change
    add_index :posts, :created_at
  end
end
