class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :product_id
      t.integer :quantity, default: 0
      t.integer :cart_id

      t.timestamps null: false
    end
  end
end
