module HomeHelper
  def timelineurl(day)
    "https://www.google.com/maps/timeline/kml?authuser=0&pb=!1m8!1m3!1i%u!2i%u!3i%u!2m3!1i%u!2i%u!3i%u" % [day.year, day.month-1, day.day, day.year, day.month-1, day.day]
  end
end
