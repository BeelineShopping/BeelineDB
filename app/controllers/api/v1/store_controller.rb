module Api
  module V1
    class StoreController < ApiController
      api :GET, '/stores'
      description "Returns a list of stores"
      formats ['json']
      def list_stores
      	# if no params, return all stores
        render :json => {:stores => Store.all}
      end

      api :GET, '/stores/:store_id'
      description "Renders a list of items located in the store"
      def store_items

      end
    end
  end
end