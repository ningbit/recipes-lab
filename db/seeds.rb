# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

array = %w{milk butter flour sugar eggs cream beef pork chicken onions soy-sauce tuna salmon avocado lime serrano-chiles pepper salt apple balsamic-vinegar lemon ramen rice breadcrumbs tomatoes potatoes cereal carrots celery broccoli spinach ginger garlic bokchoy honey hot-sauce grapes grape-jam ice-cream vodka rum gin tequila beer orange cucumber oatmeal maple-syrup}.to_a

array.each do |ingredient|
  Ingredient.create(:name => ingredient)
end

