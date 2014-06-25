class User < ActiveRecord::Base
  
  attr_accessible :name,:password,:email,:password_confirmation, :oauth_expires_at, :oauth_token, :provider, :uid
  before_save :generate_token

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      # user.email = auth.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def generate_token
    begin
        self.token = SecureRandom.hex.to_s
    end 
  end
      
end
