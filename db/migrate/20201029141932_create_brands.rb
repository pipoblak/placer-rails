class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands, id: :uuid do |t|
      t.string :name
      t.string :slug, :unique => true
      t.boolean :is_active

      t.timestamps
    end
    add_index :brands, :slug, unique: true
  end
end
