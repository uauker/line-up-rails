class Api::Facebook::V1::Events::ParticipateController < ActionController::Base
  
  respond_to :json
  
  def index
    render :json => { :total => User.all.size }   
  end
  
end