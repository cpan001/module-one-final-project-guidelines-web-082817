class Ingredient < ActiveRecord::Base

  has_and_belongs_to_many :recipes

  #creates new ingredients from array and returns an array of ingredient objs
  def self.create_ingredients_from_array(array)
    array.collect {|ing| Ingredient.find_or_create_by(name: ing)}
  end


end
