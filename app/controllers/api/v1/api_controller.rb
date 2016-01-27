module Api
	module V1
		class ApiController < ApplicationController
			skip_before_filter :verify_authenticity_token

			rescue_from 'Apipie::ParamMissing' do |exception|
			  render :json => {:param_missing => "Missing parameter"}, :status => 422
			end
		end
	end
end