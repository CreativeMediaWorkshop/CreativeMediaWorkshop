class AddClickTimesWeekToMoItems < ActiveRecord::Migration
  def change
    add_column :mo_items, :click_times_week, :integer
  end
end
