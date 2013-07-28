class User < ActiveRecord::Base
 
  validates :facebook_user_id, :presence => true, :format => { :with => /\d+/ }
  validates :facebook_name, :presence => true
  validates :event_date, :presence => true 
  validates :event_date, :uniqueness => {:scope => [:facebook_user_id]}

  before_save do
    unless self.event_date.nil?
      self.event_date = self.event_date.change({:hour => 12 , :min => 0 , :sec => 0 })
    end
  end
end