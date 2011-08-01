class ConcertsController < ApplicationController
  # GET /concerts
  # GET /concerts.xml
  def index
    @concerts = Concert.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @concerts }
    end
  end
end
