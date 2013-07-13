class Recipe < ActiveRecord::Base
  attr_accessible :title, :body, :name, :ingredients

  has_many :recipe_ingredient
  has_many :ingredients,     :through => :recipe_ingredient

  def add_ingredients(ingredient_list)
    ingredient_list.uniq.each do |ingredient|
        i = Ingredient.where(:name => ingredient.downcase.strip).first_or_create
        self.ingredients << i if !self.ingredients.include?(i)
    end
  end
end
