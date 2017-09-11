require 'food2fork'
require 'pry'
require 'unirest'

# These code snippets use an open-source library. http://unirest.io/ruby
response = Unirest.get "https://community-food2fork.p.mashape.com/search?key=efe3f39d1fcfa825711f0d701a410a08&q=shredded+chicken",
  headers:{
    "X-Mashape-Key" => "W4A6kuCD3xmsh2xY1vQbzRAlK9bAp1yGHrDjsn9sCRAOaBtNu7",
    "Accept" => "application/json"
  }

body = response.body
# title of recipe 0 body["recipes"][0]["title"]
# id of recipe 0 ["recipes"][0]["recipe_id"]
# array of titles = body["recipes"].collect {|recipe| recipe["title"]}
# array of ids = body["recipes"].collect {|recipe| recipe["recipe_id"]}

 #function to iterate over recipe array of hashes and pull out the title and recipe_id (two different functions)


# These code snippets use an open-source library. http://unirest.io/ruby
response2 = Unirest.get "https://community-food2fork.p.mashape.com/get?key=efe3f39d1fcfa825711f0d701a410a08&rId=35171",
  headers:{
    "X-Mashape-Key" => "W4A6kuCD3xmsh2xY1vQbzRAlK9bAp1yGHrDjsn9sCRAOaBtNu7",
    "Accept" => "application/json"
  }


# puts response2.body["recipe"]["recipe_id"].class
#recipe id response2.body["recipe"]["recipe_id"] => string

#ingredient response2.body["recipe"]["ingredients"] => "array of strings"
#title response2.body["recipe"]["title"] => "Chicken Turnovers"
