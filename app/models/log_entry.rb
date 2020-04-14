class LogEntry < ApplicationRecord
  validates_presence_of :day
  validates_presence_of :description

  belongs_to :user

  scope :for_user, ->(user) { where(user: user) }

  def time
    return '' unless super && super.time
    super.time.strftime('%H:%M')
  end
end
