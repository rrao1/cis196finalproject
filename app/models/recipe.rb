# Class for recipes that users can create
class Recipe < ActiveRecord::Base
  validates :ingredients, presence: true
  validates :ingredients, length: { minimum: 5 }
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
    if sum != 0
      sum / count
    else
      'No ratings yet!'
    end
  end
end
