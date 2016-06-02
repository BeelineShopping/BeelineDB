#contents of app/models/recipe.rb
class Recipe
 include HTTParty
 ENV["FOOD2FORK_KEY"] = 'a0a6e13eee9198d27d5ac48f1520ed9d'
 base_uri 'http://food2fork.com/api'
 default_params key: ENV["FOOD2FORK_KEY"]
 format :json
 
 def self.for term
 get("/search", query: { q: term})["recipes"]
 end
end