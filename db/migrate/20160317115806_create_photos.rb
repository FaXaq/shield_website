class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :description
      t.string :alt
      t.attachment :image
      t.references :gallery, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
