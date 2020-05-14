class HomeController < ApplicationController
  def index
    ts = LogEntry.for_user(current_user).where(day: Date.today).maximum(:departure)
    ts = ts.strftime("%H:%M") if ts
    ts ||= '08:00'
    @log = LogEntry.new(day: Date.today, arrival: ts)
    @google = Gloc.new()
    @entries = LogEntry.for_user(current_user).all.order('day desc', 'arrival desc')
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
