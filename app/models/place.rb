class Place < ApplicationRecord
  belongs_to :user

  scope :for_user, ->(user) { where(user: user) }

  def self.iconlist
    %w(home briefcase clinic-medical truck utensils film)
  end
end
