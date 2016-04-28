# Class for recipes that users can create
class Recipe < ActiveRecord::Base
  validates :ingredients, presence: true
  validates :ingredients, length: { minimum: 5 }
  validates :directions, presence: true
  validates :directions, length: { minimum: 5 }
  validates :name, presence: true
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :ratings, dependent: :destroy

  def average_rating
    sum = 0
    count = 0
    ratings.each do |rating|
      sum += rating.indrating
      count += 1
    end
    sum / count if sum != 0
  end
end
