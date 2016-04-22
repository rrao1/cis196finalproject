# Class for reviews for recipes
class Review < ActiveRecord::Base
  belongs_to :recipe
end
