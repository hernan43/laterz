class User < ActiveRecord::Base
  acts_as_authentic do |config|
    config.openid_required_fields = [:nickname, :email]
  end
  
  has_many :links
  has_many :categories
  
  private  
    def map_openid_registration(registration)  
      self.email = registration["email"] if email.blank?  
      self.username = registration["nickname"] if username.blank?  
    end
end
