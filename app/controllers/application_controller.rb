class ApplicationController < ActionController::Base
  protect_from_forgery

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def toggle_edition_mode
    Interpret.live_edit = !Interpret.live_edit

    redirect_to request.env["HTTP_REFERER"]
  end
end
