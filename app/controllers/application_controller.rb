class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || session[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
    session[:locale] = locale
  end
end
