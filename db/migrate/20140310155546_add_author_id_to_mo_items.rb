class AddAuthorIdToMoItems < ActiveRecord::Migration
  def change
    add_column :mo_items, :author_id, :integer
  end
end
