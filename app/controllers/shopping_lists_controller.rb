class ShoppingListsController < ApplicationController
  before_action :authenticate_app_user!
  # Shows the current user's list
  def index
  	user = current_app_user
  	@lists = user.shopping_lists.all
  end
  # Shows the item in the list
  def show
    @list = ShoppingList.find(params[:id])
  end
  # Creates a new list
  def new
    @list = current_app_user.shopping_lists.new
  end
  # POST endpoint for creating a list
  def create
    @list = current_app_user.shopping_lists.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to shopping_lists_path, notice: 'List was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  # Edit list name
  def edit
  end
  # PUT endpoint for updating list
  def update
    
  end

  def list_params
    params.require(:shopping_list).permit(:list_title)
  end
end