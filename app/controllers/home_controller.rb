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

  skip_before_action :check_tos, only: [:tos]
  def tos
    params.require(:user).permit(:accept_tos) if params[:user]

    if params.dig(:user, :accept_tos) == '1'
      current_user.tos_accepted = Time.now
      current_user.save
      redirect_to root_path
    end
  end
end
