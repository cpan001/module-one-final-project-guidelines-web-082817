class Rating < ActiveRecord::Base

  belongs_to :user
  belongs_to :recipe


  # def initialize(user, recipe, star_rating=nil, fav=nil)
  #   @user = user
  #   @recipe = recipe
  #   @star_rating = star_rating
  #   @fav = fav
  # end


end
