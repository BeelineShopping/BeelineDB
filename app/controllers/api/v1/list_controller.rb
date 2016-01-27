module Api
  module V1
    class ListController < ApiController
      before_action :authenticate_app_user!

      api :GET, '/lists'
      description "Returns a list of all the current user's shopping lists"
      def index
      	if current_app_user
      	  user = current_app_user
      	  render :json => user.shopping_lists.all
      	else
      	  render :json => {:errors => "User is not signed in"}, :status => 401
      	end
      end

      api :POST, '/lists'
      description "Creates a new shopping list"
      param :list_title, String, :desc => "Name of the list", :required => true
      formats ['application/json']
      def create
      	if current_app_user
      	  user = current_app_user
      	  list = user.shopping_lists.new
      	  list.list_title = params[:list_title]
      	  if list.save
    	    render :json => {:success => "List has been created"}, :status => 200
          else
      	    render :json => {:errors => list.errors}, :status => 400
      	  end
      	else
      	  render :json => {:errors => "User is not signed in"}, :status => 401
      	end
      end
    end
  end
end