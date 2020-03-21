class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @log = LogEntry.new(day: Date.today, time: Time.now)
    @google = Gloc.new()
    @entries = LogEntry.all.order(:day, :time)
  end
end
