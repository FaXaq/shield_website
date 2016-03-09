class CreatePostParts < ActiveRecord::Migration
  def change
    create_table :post_parts do |t|
      t.string :type
      t.string :description
      t.string :content
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
