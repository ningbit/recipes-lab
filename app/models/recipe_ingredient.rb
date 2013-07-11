class RecipeIngredient < ActiveRecord::Base
  attr_accessible :ingredient_id, :recipe_id

  belongs_to :ingredient
  belongs_to :recipe
  
end
