class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :check_tos

  def check_tos
    return unless current_user
    return unless current_user.tos_accepted.nil?

    redirect_to home_tos_path
  end

  around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || session[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
    session[:locale] = locale
  end
end
