class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    unless I18n.locale == I18n.default_locale
      options.merge({:locale => I18n.locale})
    else
      {}
    end
  end

  def toggle_edition_mode
    Interpret.live_edit = !Interpret.live_edit

    redirect_to request.env["HTTP_REFERER"]
  end
end
