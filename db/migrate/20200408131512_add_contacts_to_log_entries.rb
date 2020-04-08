class AddContactsToLogEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :log_entries, :contacts, :string
  end
end
