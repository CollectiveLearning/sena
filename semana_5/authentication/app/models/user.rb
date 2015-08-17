class User < ActiveRecord::Base
  has_secure_password


  def self.authenticate(mail, pass)
    user = find_by(email: mail)
    user && user.authenticate(pass)
  end

end