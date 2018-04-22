class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :sku
      t.string :supplier_code
      t.string :name
      t.string :attr_1
      t.string :attr_2
      t.string :attr_3
      t.string :attr_4
      t.string :attr_5
      t.float :price

      t.index :sku, unique: true

      t.timestamps
    end
  end
end
