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
          errors.add(:base, 'No places found in file')
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
    errors.add(:base, 'No places found in file') if cc == 0
  end
end
