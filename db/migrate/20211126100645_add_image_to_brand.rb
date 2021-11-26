class AddImageToBrand < ActiveRecord::Migration[6.0]
  def change
    add_column :brands, :brand_image, :string
  end
end
