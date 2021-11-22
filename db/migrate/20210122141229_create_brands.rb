class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.text :brand_name
      t.text :description
      t.text :origin
      t.text :carbon_footprint
      t.text :ethics
      t.text :material_resources
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
