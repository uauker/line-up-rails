class Api::Facebook::V1::Events::SubscribeController < ActionController::Base
  
  respond_to :json
  
  # curl -H "Content-Type: application/json; charset=UTF-8" -H 'Accept: application/json' --data '{"facebook_user_id":"1","event_date":"2013-01-31","facebook_name":"Paulo Guilherme","facebook_username":"uauker"}' --request POST "http://0.0.0.0:3000/api/facebook/v1/events/subscribe"  
  def create
      subscribe = params[:subscribe]
          
      user = User.new
      user.event_date = Date.strptime(subscribe[:event_date], "%Y-%m-%d")
      user.facebook_user_id = subscribe[:facebook_user_id]
      user.facebook_name = subscribe[:facebook_name]
      user.facebook_username = subscribe[:facebook_username]
      user.save
      
      render :json => { :status => 'success' }
    rescue
      render :json => { :status => 'error' }
  end
  
end