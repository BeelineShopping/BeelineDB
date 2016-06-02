class RecipesController < ApplicationController
	def index
		@search_term = params[:looking_for] || 'chicken'
		@recipes = Recipe.for(@search_term)
	end
end