class MatcherController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def match
		# Pull Food2Fork URL From request
		uri = params[:uri]
		# Boolean variable of whether the operation was a success or not.
		succ = true
		# Get the user's selected list from request params.
		list = ShoppingList.find(params[:list][:list_id])
		# Use the BeelineMatcher gem to get the structured ingredients from the URL.
		if recipe = BeelineMatcher::Helper.parse(uri)
			# Get the matching items from the database.
			items = items_for_recipe(recipe)
			# Loop through matching items and add them to the users list.
			items.each do |i|
				it = list.list_items.new
				it.item_id = i
				if !it.save
					# If for any reason the item is unable to be saved, set succ variable to false.
					succ = false
				end
			end
			if succ
				# Everything went well, redirect to the list with a flash notification of 
				# how many items were added.
				redirect_to list, notice: "#{items.length} items added to list."
			else
				# There was an error saving the item in the list.
				redirect_to recipes_index_path, alert: "Error adding one or more items."
			end
		else
			# No items were found for the recipe.
			redirect_to recipes_index_path, alert: "Unable to find items"
		end
	end

	# Instead of the whole app crashing when a recipe is not found, it will just redirect with error.
	rescue_from 'OpenURI::HTTPError' do |exception|
		redirect_to recipes_index_path, alert: "No valid recipe found."
	end

	private
	# Returns a set number of items for a given recipe
	def items_for_recipe(recipe)
		# Everything will be stored in terms of ounces
		ids = []
		# Loop through the structured ingredients
		recipe.each do |r|
			# Pull all items from database with matching length
			items = Item.allForName(r["name"])
			# Mostly for proof of concept, if there is only one item matching, add it to the list.
			if items.length == 1
				ids << items.first.id
			else
				# Loop through resulting items from database.
				items.each do |item|
					# Compare quantities, if the recipe calls for a quantity of less than the item,
					# add it to the database and exit the loop. 
					if r["qty"] <= item.qty
						ids << item.id
						break
					end
				end
			end
		end
		# Return the list of matching IDs
		return ids
	end
end