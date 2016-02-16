module Api
  module V1
    class UserController < ApiController
      before_action :authenticate_app_user!
      def logged_in
        render :json => current_app_user
      end
    end
  end
end