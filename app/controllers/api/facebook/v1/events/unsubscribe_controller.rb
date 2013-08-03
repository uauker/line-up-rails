class Api::Facebook::V1::Events::UnsubscribeController < ActionController::Base
  
  respond_to :json
  
  # curl -H "Content-Type: application/json; charset=UTF-8" -H 'Accept: application/json' --data '{"facebook_user_id":"1","event_date":"2013-01-31"}' --request GET "http://0.0.0.0:3000/api/facebook/v1/events/unsubscribe"  
  def index
      unsubscribe = params[:unsubscribe]
      
      date = Date.strptime(unsubscribe[:event_date], "%Y-%m-%d")
      
      user = User.where(:facebook_user_id => unsubscribe[:facebook_user_id], :event_date => date.to_date).first
      user.destroy
      
      render :json => { :status => 'success' }
    rescue
      render :json => { :status => 'error' }
  end
  
end