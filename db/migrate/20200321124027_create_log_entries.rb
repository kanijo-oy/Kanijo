class CreateLogEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :log_entries do |t|
      t.date :day
      t.time :time
      t.string :description

      t.timestamps
    end
  end
end
