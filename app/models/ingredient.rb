class Ingredient < ActiveRecord::Base
  attr_accessible :name, :recipes 

  validates_presence_of :name

  has_many :recipe_ingredient
  has_many :recipes,     :through => :recipe_ingredient

  def self.add_cart(cart_list)
  	cart_list.uniq.each do |item|
        i = Ingredient.new(:name => item.downcase.strip)
        i.save if !self.all.include?(i)
    end
  end

  def self.dispose_garbage(item_list)
  	item_list.uniq.each do |item|
        @i = Ingredient.find_by_name(item)
        @i.destroy if !@i.nil?
    end
  end

end
