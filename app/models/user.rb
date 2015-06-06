class User < ActiveRecord::Base
  before_create :set_auth_token

  devise :database_authenticatable, :registerable

  private
  def set_auth_token
    loop do
      self.auth_token = SecureRandom.hex
      break unless User.exists?(auth_token: self.auth_token)
    end
  end
end
