class User < ActiveRecord::Base

  has_many :ratings
  has_many :recipes, through: :ratings


  # def initialize(name)
  #   @name = name
  # end

  #########CREATING RECIPE STEPS########

  #creates new recipe object and associates with ingredients, returns recipe object
  def create_recipe(title, ingredients_array)
    recipe = Recipe.find_or_create_by(title: title)
    recipe.ingredients = Ingredient.create_ingredients_from_array(ingredients_array)
    recipe
  end

  #############################

  #returns favorite recipe rating objects
  def fav_recipes
    self.reload.ratings.select {|rating| rating.fav}
  end
   # adds rating to new Rating object and returns all ratings for that recipe
  def rate_recipe(rating, recipe)
    recipe.ratings << Rating.create(user: self, recipe: recipe, star_rating: rating)
  end
  #puts out favorite recipe names
  def fav_recipes_names(fav_recipes)
    fav_recipes.each.with_index(1) do |rating, i|
      puts "#{i}. Title: #{rating.recipe.title.capitalize}"
      puts "      Ingredients: #{rating.recipe.ingredients_name_string}"
      puts "------------------------------------------------------------------------------------------------------"
    end
  end


end
