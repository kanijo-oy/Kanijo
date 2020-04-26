class AddFieldsToLogEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :log_entries, :duration, :integer
    add_column :log_entries, :placename, :string
    add_column :log_entries, :address, :string
    add_column :log_entries, :persons, :string
  end
end
