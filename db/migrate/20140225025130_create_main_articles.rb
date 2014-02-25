class CreateMainArticles < ActiveRecord::Migration
  def change
    create_table :main_articles do |t|
      t.string :title
      t.string :subtitle
      t.integer :author_id
      t.date :date
      t.text :content

      t.timestamps
    end
  end
end
