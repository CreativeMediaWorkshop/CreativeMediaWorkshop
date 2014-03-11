class RemoveAuthorFromMoItems < ActiveRecord::Migration
  def change
    remove_column :mo_items, :author, :string
  end
end
