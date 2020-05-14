json.extract! log_entry, :id, :day, :arrival, :departure, :place, :people_num, :persons, :created_at, :updated_at
json.url log_entry_url(log_entry, format: :json)
