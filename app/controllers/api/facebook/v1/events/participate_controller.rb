class Api::Facebook::V1::Events::ParticipateController < ActionController::Base
  
  respond_to :json
  
  def index
    render :json => User.limit(15)
  end
  
end