class CreateMoItems < ActiveRecord::Migration
  def change
    create_table :mo_items do |t|
      t.string :title
      t.string :subtitle
      t.float :price
      t.string :file
      t.string :author
      t.text :description
      t.string :type
      t.integer :click_times

      t.timestamps
    end
  end
end
