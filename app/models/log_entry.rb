class LogEntry < ApplicationRecord
  validates_presence_of :day
  validates_presence_of :description

  def time
    return '' unless super && super.time
    super.time.localtime.strftime("%H:%M")
  end
end
