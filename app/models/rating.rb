class Rating < ActiveRecord::Base

  attr_accessor :star_rating, :user, :recipe

  def initialize(star_rating, user, recipe)
    @star_rating = star_rating
    @user = user
    @recipe = recipe
  end


end
