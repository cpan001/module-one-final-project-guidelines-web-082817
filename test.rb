require 'food2fork'
require 'pry'
require 'unirest'
require 'json'

# These code snippets use an open-source library. http://unirest.io/ruby
response = Unirest.get "https://community-food2fork.p.mashape.com/search?key=efe3f39d1fcfa825711f0d701a410a08&q=shredded+chicken",
  headers:{
    "X-Mashape-Key" => "W4A6kuCD3xmsh2xY1vQbzRAlK9bAp1yGHrDjsn9sCRAOaBtNu7",
    "Accept" => "application/json"
  }

# puts response.body

# These code snippets use an open-source library. http://unirest.io/ruby
response2 = Unirest.get "https://community-food2fork.p.mashape.com/get?key=efe3f39d1fcfa825711f0d701a410a08&rId=35171",
  headers:{
    "X-Mashape-Key" => "W4A6kuCD3xmsh2xY1vQbzRAlK9bAp1yGHrDjsn9sCRAOaBtNu7",
    "Accept" => "application/json"
  }


# puts response2.body
