class AddSiteUrlToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :site_url, :string
  end
end
