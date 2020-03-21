class LogEntry < ApplicationRecord
  validates_presence_of :day
  validates_presence_of :description
end
