class SubscriptorsController < ApplicationController
  def create
    
    h = Hominid::API.new(MAILCHIMP_API_KEY, :secure => true)
    list_id = h.lists['data'].first['id']
    @errors = []

    if params[:subscriptor][:email].blank?
        @errors << t('subscriptors.missing_email')
    elsif params[:subscriptor][:email] !~ /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i
        @errors << t('subscriptors.invalid_email')
    else
        begin
          @member = h.listMemberInfo(list_id, params[:subscriptor])
          # Adding subscriber
          h.list_subscribe(list_id, params[:subscriptor][:email])
          @subscriptor = Subscriptor.new params[:subscriptor]
        rescue Hominid::APIError => e
          @errors << t('subscriptors.already_subscribed')
        end
    end

    respond_to do |wants|
        wants.js  
    end
  end
end
