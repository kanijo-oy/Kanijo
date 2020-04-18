class LogCleanupJob < ApplicationJob
  queue_as :default

  def perform(*args)
    LogEntry.transaction do
      LogEntry.destroy_by("day < ?", 14.days.ago)
    end
  end
end
