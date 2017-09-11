class User < ActiveRecord::Base

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def create_recipe(title, ingredients)
    ingredient_array = ingredients.split(" ").each do |ingredient|
    new_recipe = Recipe.new(title, )

  end




end
