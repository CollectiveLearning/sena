class Session
  include ActiveModel::Model

  attr_accessor :email, :password

  validates :email, presence: true
  validates :password, presence: true
end