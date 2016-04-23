require 'bcrypt'
# User class for users to create recipes and review/rate others'
class User < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { minimum: 2 }
  validate :name_check
  has_many :recipes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def name_check
    unless name.nil?
      errors.add(:name, 'name is not capitalized') if name[0] != name[0].upcase
    end
  end
end
