class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories, id: :uuid do |t|
      t.string :name
      t.string :slug, :unique => true
      t.boolean :is_actives
      t.uuid :parent_category_id
      
      t.timestamps
    end
    
    add_index :categories, :slug, unique: true

  end
end
