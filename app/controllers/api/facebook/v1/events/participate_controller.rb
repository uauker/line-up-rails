class Api::Facebook::V1::Events::ParticipateController < ActionController::Base
  
  respond_to :json
  
  # curl -H "Content-Type: application/json; charset=UTF-8" -H 'Accept: application/json' --data '{"facebook_user_id":"1","event_date":"2013-01-31","facebook_name":"Paulo Guilherme","facebook_username":"uauker"}' --request GET "http://0.0.0.0:3000/api/facebook/v1/events/participate"
  def index
      p params[:participate]
      
      p params[:participate][:facebook_name]
      
      render :json => { :status => 'success' }
    rescue
       render :json => { :status => 'error' }    
  end
  
  def create
    p request.body.read
    render :json => {  }    
  end  
  
  # GET /events/participate/1
  def show
      render :json => User.where('facebook_user_id = ?', params[:id])
    rescue
      render :json => { :status => 'error' }
  end
  
end