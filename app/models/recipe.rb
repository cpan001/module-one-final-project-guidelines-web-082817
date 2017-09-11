class Recipe < ActiveRecord::Base

  attr_reader :title, :ingredients

  def initialize(title, ingredients)
    @title = title
    @ingredients = ingredients
  end

end
