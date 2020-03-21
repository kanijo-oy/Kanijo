class AddUserToLogEntries < ActiveRecord::Migration[6.0]
  def change
    add_reference :log_entries, :user, null: false, foreign_key: true
  end
end
