require "bcrypt"
class User
  include Mongoid::Document
  include Mongoid::Token
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password_digest, type: String
  token :token => :alphanumeric, :length => 16

  # validates :email, :first_name, :last_name, uniqueness: :true, presence :true

  def full_name
    if self.first_name && self.last_name 
      self.first_name + " " + self.last_name 
    else
    "unknown"
    end
  end

  def password
    @password
  end

  def password=(new_password)
    @password = new_password
    self.password_digest = BCrypt::Password.create(new_password)
  end

  def authenticate(test_password)
    if BCrypt::Password.new(self.password_digest) == test_password
      self
    else
      false
    end
  end
end