class LogEntry < ApplicationRecord
  validates_presence_of :day
  validates_presence_of :description

  belongs_to :user

  scope :for_user, ->(user) { where(user: user) }

  def time
    return '' unless super && super.time
    super.time.strftime('%H:%M')
  end

  def durationtext
    return '' unless duration
    ['?', '<15min', '>15min'][duration]
  end

  def self.num_options
    %w(0 1 2 3 4 5 6-10 11-25 26-50 50+)
  end
end
