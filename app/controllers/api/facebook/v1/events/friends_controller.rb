class Api::Facebook::V1::Events::FriendsController < ActionController::Base
  
  respond_to :json
  
  # curl -H "Content-Type: application/json; charset=UTF-8" -H 'Accept: application/json' --data '{"facebook_users_id":"1,2,3","event_date":"2013-01-31"}' --request POST "http://0.0.0.0:3000/api/facebook/v1/events/friends"  
  def create
      friends = params[:facebook_users_id].split(',')
      
      start_date = Date.strptime(params[:event_date], "%Y-%m-%d")
      start_date = start_date.change({:hour => 0, :min => 0, :sec => 0})
      
      end_date = Date.strptime(params[:event_date], "%Y-%m-%d")
      end_date = end_date.change({:hour => 23, :min => 59, :sec => 59})

      render :json => User.where('facebook_user_id IN (?) AND event_date BETWEEN ? AND ?', friends, start_date, end_date)
    rescue
      render :json => { :status => 'error' }
  end
  
end