class RecipeIngredient < ActiveRecord::Base

  attr_reader :recipe, :ingredient

  def initialize(recipe, ingredient)
    @recipe = recipe
    @ingredient = ingredient
  end


end
