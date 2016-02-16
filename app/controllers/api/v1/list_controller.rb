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
    end
  end
end