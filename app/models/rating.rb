# Class for ratings of recipes
class Rating < ActiveRecord::Base
  belongs_to :crecipe
  validates :indrating, presence: true
  # validate :range
  validates :indrating, :inclusion => {:in => [1, 10]}
  validate :existing

  def range
    if indrating < 1 || indrating > 10
      # errors.add(:indrating, 'Must rate from 1 to 10!')
      redirect_to "/recipes/#{recipe_id}/ratings/new", notice: 'Recipe was successfully created.'
    end
  end

  def existing
    user1_id = user_id
    bool = false
    Recipe.find(recipe_id).ratings.each do |rating|
      bool = true if rating.user_id == user1_id
    end
    errors.add(:user_id, 'You cannot rate a recipe twice') if bool
  end
end
