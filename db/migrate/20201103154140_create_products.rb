class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products, id: :uuid do |t|
      t.string :name
      t.string :slug
      t.integer :height
      t.integer :width
      t.integer :length
      t.string :title
      t.string :description
      t.string :specifications
      t.string :ean
      t.boolean :is_available
      t.string :thumbnail
      t.string :images
      t.string :attatchments
      t.references :category, foreign_key: true, type: :uuid
      t.references :brand, foreign_key: true, type: :uuid
      t.timestamps
    end
  end
end
