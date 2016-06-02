class RecipesController < ApplicationController
	def index
		@search_term = params[:looking_for] || 'chicken'
		@recipes = Recipe.for(@search_term)
		if current_app_user
			@lists = current_app_user.shopping_lists
		else
			@lists = []
		end
	end
end