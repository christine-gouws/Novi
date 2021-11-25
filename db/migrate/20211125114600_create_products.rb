class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.text :product_name
      t.integer :product_price
      t.string :image_url
      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
