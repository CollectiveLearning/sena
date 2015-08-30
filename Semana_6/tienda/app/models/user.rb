class User < ActiveRecord::Base
  has_secure_password

  enum identification_type: [:cedula_ciudadania, :tarjeta_de_identidad,
                             :cedula_extranjeria, :pasaporte]
  enum gender: [:masculino, :femenino, :indefinido]

  def self.authenticate(email, password)
    user = find_by(email: email)
    user && user.authenticate(password)
  end

end

