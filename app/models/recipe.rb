class Recipe < ApplicationRecord
  belongs_to :cuisine

  validates :title, :recipe_type, :difficulty, :cook_time, :ingredients, :method, presence: true
end
