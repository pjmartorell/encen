class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

  def set_locale
    unless APP_CONFIG['hosting']
      if params[:locale] && I18n.available_locales.include?(params[:locale].to_sym)
        I18n.locale = params[:locale]
      end
    else
      I18n.locale = HOST_LOCALES[request.host] if HOST_LOCALES.keys.include? request.host
    end
  end

  def default_url_options(options={})
    unless APP_CONFIG['hosting']
      {:locale => I18n.locale}
    else
      {}
    end
  end
end
