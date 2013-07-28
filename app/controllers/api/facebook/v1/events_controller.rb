class Api::Facebook::V1::EventsController < ActionController::Base
  
  respond_to :json
  
  def index
    render :json => { :teste => "testando" }
  end
  
end