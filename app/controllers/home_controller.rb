class HomeController < ApplicationController
  def index
    @log = LogEntry.new(day: Date.today, time: Time.now.localtime.strftime("%H:%M"))
    @google = Gloc.new()
    @entries = LogEntry.all.where(user: current_user).order('day desc', 'time desc')
  end

  def policy
  end

  def help
  end
end
