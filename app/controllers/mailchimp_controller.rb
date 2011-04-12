class MailchimpController < ApplicationController
  def unsubscribe
    subscriptor = Subscriptor.find_by_token(params[:token])

    if subscriptor
      subscriptor.unsubscribe
      head :ok
    else
      raise ActionController::RoutingError, "invalid route"
      return
    end
  end
end
