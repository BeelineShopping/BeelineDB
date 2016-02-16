module Api
  module V1
    class StoreController < ApiController
      def list_stores
      	# if no params, return all stores
        render :json => {:stores => Store.all}
      end
      def store_items
        store = Store.find(params[:store_id])
        render :json => store, :include => {:aisles =>  {:only => :aisle_number, :include => {:sections => {:only => :section_number, :include => {:items => {:only => [:id, :title]}}}}}}, :status => 200
      end
    end
  end
end