require_relative '../config/environment'

# natalie = User.all.first
# christina = User.all.second
#
# grilled_cheese = natalie.create_recipe("grilled cheese", ["cheese", "bread"])
# tacos = christina.create_recipe("tacos", ["beef", "tortilla"])
# christina.rate_recipe(4, grilled_cheese)
# natalie.rate_recipe(5, grilled_cheese)


CLI.new.run
