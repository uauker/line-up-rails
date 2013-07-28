class Api::Facebook::V1::EventsController < ActionController::Base
  
  respond_to :json
  
  def index
    render :json => { :total => User.all.size }
  end
  
  # GET /events/new
  def new
      # facebook_user_id=1&event_date=2013-01-31&facebook_name=Paulo+Guilherme
      
      user = User.new
      user.event_date = Date.strptime(params[:event_date], "%Y-%m-%d")
      user.facebook_user_id = params[:facebook_user_id]
      user.facebook_name = params[:facebook_name]
      user.save
      
      render :json => { :status => 'success' }
    rescue Exception => e
      render :json => { :status => 'error', :cause => e }
  end

  # GET /events/1?facebook_users_id=1&event_date=2013-01-31  
  def show
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