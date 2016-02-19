class ListItemsController < ApplicationController
	before_action :authenticate_app_user!
	def new
		@list = ShoppingList.find(params[:shopping_list_id])
		@item = @list.list_items.build
	end

	def create
		@list = ShoppingList.find(params[:shopping_list_id])
		item_build = params[:list_item]
		itemId = Item.byItemName(item_build[:item_name]).id
		puts itemId
		item = @list.list_items.new
		item.item_id = itemId
		if item.save()
			redirect_to @list, {:flash => {:success => "Added item to cart!"}}
		else
			redirect_to @list, {:flash => {:danger => "Unable to add item to cart!"}}
		end
	end
end