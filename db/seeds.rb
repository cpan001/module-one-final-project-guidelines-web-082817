require_relative "../app/models/rating.rb"
require_relative "../app/models/recipe.rb"
require_relative "../app/models/user.rb"
require_relative "../app/models/ingredient.rb"
require_relative "../lib/CLI.rb"


mom = User.create(name: "Mom")
christina = User.create(name: "Christina")
natalie = User.create(name: "Natalie")
anna = User.create(name: "Anna")
john = User.create(name: "John")
ian = User.create(name: "Ian")

#
# natalie.create_recipe("corn chowder", ["corn", "potatoes", "milk"], "boil corn with potates and milk and potatoes")
# christina.create_recipe("grilled cheese", ["cheese", "bread"], "grill cheese between two slices of bread until melted")
# mom.create_recipe("fried chicken", ["chicken", "flour", "salt", "oil"], "dip chicken in flour with spices and fry in oil until done")
