class MatcherController < ApplicationController
	skip_before_filter :verify_authenticity_token
	def match
		uri = params[:uri]
		if recipe = BeelineMatcher::Helper.parse(uri)
			items = items_for_recipe(recipe)
			render :json => {:success => recipe}
		else
			render :json => {:error => "Unable to find items"}, :status => 400
		end
	end

	rescue_from 'OpenURI::HTTPError' do |exception|
		render :json => {:error => "Recipe not found"}, :status => 404
	end

	private
	# Returns a set number of items for a given recipe
	def items_for_recipe(recipe)
		# Everything will be stored in terms of ounces
		recipe.each do |r|
			puts "hey"
		end
	end
end