class Api::Facebook::V1::Events::MeController < ActionController::Base
  
  respond_to :json
  
  # GET /events/me/1
  def show
      render :json => User.where('facebook_user_id = ?', params[:id])
    rescue
      render :json => { :status => 'error' }
  end

end