class AddMarketingToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :marketing_mails, :boolean
  end
end
