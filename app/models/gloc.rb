require 'crack'

class Gloc < ApplicationRecord
  has_many_attached :uploads

  attribute :user

  before_save :parse_upload
  def parse_upload
    return unless uploads.attached?
    cc = 0
    uploads.blobs.each do |f|
      f.download do |dd|
        doc = Crack::XML.parse(dd)
        pms = doc.dig('kml', 'Document', 'Placemark')
        unless pms
          # errors.add(:base, I18n.t(:import_empty))
          next
        end
        pms.each do |place|
          next unless place.is_a? Hash
          next unless place.dig('TimeSpan', 'begin')
          ts = Time.parse(place['TimeSpan']['begin'])
          LogEntry.new(day: ts, time: ts, description: place['name'], user: user).save
          cc += 1
        end
      end
    end
    errors.add(:base, I18n.t(:import_empty)) if cc == 0
  end
end
