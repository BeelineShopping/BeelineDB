module Api
	module V1
		class ApiController < ApplicationController
			skip_before_filter :verify_authenticity_token
			#before_filter :check_auth

			def check_authentication
				resource = AppUser.find_by_email(username)
				if resource.valid_password?(password)
					return resource
				end
			end

  			#def check_auth
    		#	authenticate_or_request_with_http_basic do |username,password|
      		#		resource = AppUser.find_by_email(username)
      		#		if resource.valid_password?(password)
        	#			sign_in :user, resource
      		#		end
    		#	end
    		#end
			rescue_from 'Apipie::ParamMissing' do |exception|
			  render :json => {:param_missing => "Missing parameter"}, :status => 422
			end
		end
	end
end