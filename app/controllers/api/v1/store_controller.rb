module Api
  module V1
    class StoreController < ApplicationController
      api :GET, '/stores'
      description "Returns a list of stores"
      formats ['json']
      def list_stores
      	# if no params, return all stores
        render :json => {:stores => Store.all}
      end
    end
  end
end