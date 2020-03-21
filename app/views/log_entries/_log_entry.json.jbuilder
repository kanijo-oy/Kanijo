json.extract! log_entry, :id, :day, :time, :description, :created_at, :updated_at
json.url log_entry_url(log_entry, format: :json)
