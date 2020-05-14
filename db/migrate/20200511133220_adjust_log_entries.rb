class AdjustLogEntries < ActiveRecord::Migration[6.0]
  def change
    remove_column :log_entries, :placename
    rename_column :log_entries, :description, :place
    remove_column :log_entries, :duration
    rename_column :log_entries, :time, :arrival
    add_column :log_entries, :departure, :time
    rename_column :log_entries, :contacts, :people_num
  end
end
