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
        store = Store.find(params[:store_id])
        render :json => store, :include => {:aisles =>  {:only => :aisle_number, :include => {:sections => {:only => :section_number, :include => {:items => {:only => [:id, :title]}}}}}}, :status => 200
      end
    end
  end
end