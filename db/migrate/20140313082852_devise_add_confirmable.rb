class DeviseAddConfirmable < ActiveRecord::Migration
  def change
    add_column :cmw_accounts,:confirmation_token, :string
    add_column :cmw_accounts,:confirmed_at, :datetime
    add_column :cmw_accounts,:confirmation_sent_at, :datetime
    add_column :cmw_accounts,:unconfirmed_email, :string # Only if using reconfirmable
    add_index :cmw_accounts, :confirmation_token,   :unique => true
  end
end
