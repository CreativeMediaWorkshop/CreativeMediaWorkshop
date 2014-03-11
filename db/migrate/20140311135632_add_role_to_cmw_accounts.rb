class AddRoleToCmwAccounts < ActiveRecord::Migration
  def change
    add_column :cmw_accounts, :role, :string, :default => 'user'
  end
end
