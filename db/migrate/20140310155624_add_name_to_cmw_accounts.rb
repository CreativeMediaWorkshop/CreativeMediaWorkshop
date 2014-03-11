class AddNameToCmwAccounts < ActiveRecord::Migration
  def change
    add_column :cmw_accounts, :name, :string
  end
end
