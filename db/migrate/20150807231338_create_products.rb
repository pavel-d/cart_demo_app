class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :discount_id, index: true

      t.timestamps null: false
    end
  end
end
