require 'bundler'
Bundler.require
require_relative "../app/models/rating.rb"
require_relative "../app/models/recipe.rb"
require_relative "../app/models/user.rb"
require_relative "../app/models/ingredient.rb"
require_relative "../lib/CLI.rb"
require_relative "../lib/API.rb"



ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'

ActiveRecord::Base.logger = nil
