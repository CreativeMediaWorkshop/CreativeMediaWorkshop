class AvoidAmbiguationInMoItem < ActiveRecord::Migration
  def change
  	add_column :mo_items, :item_type, :string
  	remove_column :mo_items, :type, :string
  end
end
