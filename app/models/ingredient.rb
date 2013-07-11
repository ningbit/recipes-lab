class Ingredient < ActiveRecord::Base
  attr_accessible :name, :recipes 

  has_many :recipe_ingredient
  has_many :recipes,     :through => :recipe_ingredient

end
