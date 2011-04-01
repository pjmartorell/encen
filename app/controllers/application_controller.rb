class ApplicationController < ActionController::Base
  protect_from_forgery

  def toggle_edition_mode
    Interpret.live_edit = !Interpret.live_edit

    redirect_to request.env["HTTP_REFERER"]
  end
end
