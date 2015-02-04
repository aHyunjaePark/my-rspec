class User < ActiveRecord::Base
  attr_accessor :password, :password_confirmation
  # validates :email, presence: true
  validates :name, presence: true, length: {maximum: 50}
  validates :email, format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/}
  # validates :password_digest, presence: true
  before_save :encrypt_password

  # has_secure_password

  def encrypt_password
    if password_matches?
      self.password_digest = BCrypt::Engine.hash_secret(self.password, BCrypt::Engine.generate_salt)
    else
      self.errors.messages[:not_math] = "not match"
      return false
    end
  end

  def password_matches?
    self.password == self.password_confirmation
  end
end
