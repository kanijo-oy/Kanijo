require 'crack'

class Gloc < ApplicationRecord
  has_many_attached :uploads

  before_save :parse_upload
  def parse_upload
    return unless uploads.attached?
    uploads.blobs.each do |f|
      f.download do |dd|
        doc = Crack::XML.parse(dd)
        doc['kml']['Document']['Placemark'].each do |place|
          ts = Time.parse(place['TimeSpan']['begin'])
          LogEntry.new(day: ts, time: ts, description: place['name']).save
        end
      end
    end
  end
end
