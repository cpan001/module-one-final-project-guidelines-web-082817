require_relative "../app/models/rating.rb"
require_relative "../app/models/recipe.rb"
require_relative "../app/models/user.rb"
require_relative "../app/models/ingredient.rb"
require 'colorize'

require 'pry'

class CLI

  def welcome
    puts "Welcome to the Recipe App!"
    puts "You can create and save your own recipe, get a randomly selected recipe, or search for a new recipe!"
  end

  #asks for user name, gets user name string, finds or creates and saves user object, and returns user object
  def user_obj
    puts "Please enter your name: "
    user_name = gets.strip
    User.find_or_create_by(name: user_name)
  end

# black, :light_black, :red, :light_red, :green, :light_green, :yellow, :light_yellow, :blue, :light_blue, :magenta, :light_magenta, :cyan, :light_cyan, :white, :light_white, :default]
  def menu
    puts "**********************************************************".colorize(:magenta).blink
    puts "Select an option (1-5) from the menu below:".colorize(:light_black).bold
    puts "---------------------------------------------------------".colorize(:cyan)
    puts "1. Don't want to think about what to cook?  \n   Spin the RANDOM WHEEL OF RECIPES!".colorize(:light_black)
    puts "---------------------------------------------------------".colorize(:cyan)
    puts "2. Need some inspiration for cooking?  \n   Find recipe by name OR \n   if you have leftover ingredients search your ingredients!".colorize(:light_black)
    puts "---------------------------------------------------------".colorize(:cyan)
    puts "3. Feeling creative?  \n   Write and save your own recipe!".colorize(:light_black)
    puts "---------------------------------------------------------".colorize(:cyan)
    puts "4. View ALL your favorite recipes in 1 place!".colorize(:light_black)
    puts "---------------------------------------------------------".colorize(:cyan)
    puts "5. You're done?  Time to exit...".colorize(:light_black)
    puts "**********************************************************".colorize(:magenta).blink
  end

  def valid_menu_selection?(input)
    input.class == Fixnum && input.between?(1,5)
  end

  #performs one turn of menu selection and returns a selection number
  def user_menu_input
    menu
    user_menu_selection = gets.strip.to_i
    if valid_menu_selection?(user_menu_selection)
      user_menu_selection
    else
      puts "Invalid input!"
      user_menu_input
    end
  end

  #calls different methods dependent on user input
  def selection(input, user)
    case input
    when 1
      get_number_of_random_recipes(user)
    when 2
      run_option_find_recipe_by_name
    when 3
      run_option_create(user)
    when 4
      run_option_view_favs(user)
    end
  end

  def turn(user)
    user_menu_choice = user_menu_input
    unless user_menu_choice == 5
      selection(user_menu_choice, user)
      turn(user)
    end
  end

  def run
    welcome
    user = user_obj
    turn(user)
    exit_program
  end

  ##### CREATING RECIPE OPTION ########
  #asks user for recipe name and gets the name in a string
  def get_recipe_name
    puts "What's the name of your recipe?"
    user_recipe_name = gets.strip
  end

  #asks user to put in ingredients in a string, splits it and returns an array of ingredients
  def get_recipe_ingredients
    puts "What ingredients are in your recipe?  Please enter ingredients separated by commas with no ands."
    user_ingredients = gets.strip
    user_ingredients.split(/\s*\,\s*/)
  end

  def run_option_create(user)
    recipe_name = get_recipe_name
    user.create_recipe(recipe_name, get_recipe_ingredients)
    puts "************* :) :D :P *************"
    puts "You just saved your #{recipe_name} recipe into your favorites!"
    puts "************* :) :D :P *************"
  end

  def get_recipe_rating
    puts "How would you rate this recipe? enter 1-5. 1 means you hated it, 5 means you LOVED it!"
    user_rating = gets.strip
  end
  #######################################

  ########## VIEW FAV RECIPES ###########
  def run_option_view_favs(user)
    puts "Here are your favorite recipes:"
    user.fav_recipes_names(user.fav_recipes)
  end
  #######################################

  ############# RANDOM RECIPE GENERATOR #############

  def get_number_of_random_recipes(user)
    puts "How many random recipes would you like to choose from?"
    num_of_choices = gets.strip.to_i
    num_random_recipes = user.fav_recipes.sample(num_of_choices)
    puts "Here are all your random recipes! Choose wisely..."
    user.fav_recipes_names(num_random_recipes)
  end

    ########## SEARCH API BY NAME ###############

  def get_recipe_name_from_user
    puts "Enter a recipe name you want to search by: "
    find_by_name = gets.strip.downcase
  end

  def convert_name_for_api(name)
    name.gsub(/[^A-Za-z\s]/, '').gsub(/\s+/,"+")
  end

  #calls api methods to get recipes titles array and print them out
  def print_api_call_menus
    name = convert_name_for_api(get_recipe_name_from_user)
    recipes_array = API.call_by_recipe_name(name)
    API.recipes_titles_array.each_with_index do |title, i|
      puts "#{i + 1}. #{title.capitalize}"
      puts "----------------------------------------"
    end
  end

  def get_menu_selection
    puts "Which menu do you want to select to see more? Enter a number: "
    user_recipe_select = gets.strip.to_i #1
  end

  def print_api_individual_recipe(n)
    recipe_id = API.recipes_ids_array[n-1]
    recipe_hash = API.call_by_recipe_id(recipe_id)
    puts "Title: #{API.recipe_title(recipe_hash)}"
    puts "Ingredients: "
    API.recipe_ingredients(recipe_hash).each do |ing|
      puts "   #{ing}"
    end
  end

  def run_option_find_recipe_by_name
    print_api_call_menus
    print_api_individual_recipe(get_menu_selection)
  end



  ########## EXIT PROGRAM ###############
  def exit_program
    puts "Goodbye!"
  end
  #######################################



end
