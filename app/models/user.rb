require 'securerandom'

class User < ApplicationRecord
  before_save :generate_api_key

  validates :email, presence: true, uniqueness: true
  validates_presence_of :password
  validates_confirmation_of :password, on: :create

  has_secure_password

  # has_many_favorites
  private

  def generate_api_key
    self.api_key = SecureRandom.urlsafe_base64
  end
end
