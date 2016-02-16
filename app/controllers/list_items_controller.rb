class ListItemsController < ApplicationController
	before_action :authenticate_app_user!
	def new
		@list = ShoppingList.find(params[:shopping_list_id])
		@item = @list.list_items.build
	end

	def create
		@list = ShoppingList.find(params[:shopping_list_id])
		item_build = params[:list_item]
		itemId = Item.byItemName(item_build[:item_name]).first.id
		item = @list.list_items.new
		item.item_id = itemId
		if item.save()
			redirect_to shopping_lists_path(:shopping_list_id)
		else
			throw exception
		end
	end
end