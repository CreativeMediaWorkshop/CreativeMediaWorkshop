class ChangeDefaultAndTypeForMoItems < ActiveRecord::Migration
  def change
  	remove_column :mo_items, :price, :float
  	add_column :mo_items, :price, :float, :default => 1

  	remove_column :mo_items, :item_type, :string
  	add_column :mo_items, :item_type, :string, :default => 'image'

  	add_column :mo_items, :via_uploader, :boolean, :default => true

  	add_column :mo_items, :file_url_manual, :string
  end
end
