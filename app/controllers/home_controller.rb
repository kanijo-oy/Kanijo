class HomeController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
    @log = LogEntry.new(day: Date.today, time: Time.now.localtime.strftime("%H:%M"))
    @google = Gloc.new()
    @entries = LogEntry.all.order(:day, :time)
  end

  def policy
  end
end
