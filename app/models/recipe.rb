class Recipe < ActiveRecord::Base

  has_many :ratings
  has_many :users, through: :ratings
  has_and_belongs_to_many :ingredients

  def ingredients_name_string
    self.ingredients.collect {|ing| "\n      \u2022 " + ing.name.capitalize}.join("")
  end

end
