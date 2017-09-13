require_relative "../app/models/rating.rb"
require_relative "../app/models/recipe.rb"
require_relative "../app/models/user.rb"
require_relative "../app/models/ingredient.rb"

require 'pry'

class API

  #calls the api based on converted name string and returns a recipes hash with title, id, and url info
  def self.call_by_recipe_name(name)
    response = Unirest.get "https://community-food2fork.p.mashape.com/search?key=efe3f39d1fcfa825711f0d701a410a08&q=#{name}",
      headers:{
        "X-Mashape-Key" => "W4A6kuCD3xmsh2xY1vQbzRAlK9bAp1yGHrDjsn9sCRAOaBtNu7",
        "Accept" => "application/json"
      }
    body = response.body
    @recipes_hash = body["recipes"][0...10] #array of recipe hashes
  end

  def self.recipes_titles_array
    @recipes_hash.collect {|recipe| recipe["title"]}
  end

  def self.recipes_ids_array
    @recipes_hash.collect {|recipe| recipe["recipe_id"]}
  end

  def self.recipes_urls_array
    @recipes_hash.collect {|recipe| recipe["source_url"]}
  end

  def self.call_by_recipe_id(id)
    result = Unirest.get "https://community-food2fork.p.mashape.com/get?key=efe3f39d1fcfa825711f0d701a410a08&rId=#{id}",
      headers:{
        "X-Mashape-Key" => "W4A6kuCD3xmsh2xY1vQbzRAlK9bAp1yGHrDjsn9sCRAOaBtNu7",
        "Accept" => "application/json"
      }
    body = result.body
    body["recipe"] #individual recipe hash
  end

  #array of string ingredients
  def self.recipe_ingredients(recipe_hash)
    recipe_hash["ingredients"]
  end

  def self.recipe_title(recipe_hash)
    recipe_hash["title"]
  end

  #returns recipe source url in string
  def self.source_url(recipe_hash)
    recipe_hash["source_url"]
  end


end
