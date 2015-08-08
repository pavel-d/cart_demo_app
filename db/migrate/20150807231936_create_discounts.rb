class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.decimal :absolute_value, default: 0
      t.decimal :relative_value, default: 0
      t.integer :threshold

      t.timestamps null: false
    end
  end
end
