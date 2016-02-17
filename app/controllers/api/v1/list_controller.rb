module Api
  module V1
    class ListController < ApiController
      before_action :authenticate_app_user!

      api :GET, '/lists'
      description "Returns a list of all the current user's shopping lists"
      def index
      	if current_app_user
      	  user = current_app_user
      	  render :json => {"shopping_lists" => prettify_lists(user.shopping_lists.all) }
      	else
      	  render :json => {:errors => "User is not signed in"}, :status => 401
      	end
      end

      def prettify_lists(lists)
        out = Array.new
        lists.each do |list|
          inner = Hash.new
          inner[:list_title] = list.list_title
          items = Array.new
          list.list_items.each do |item|
            itemHash = Hash.new
            itemObj = Item.find(item.item_id)
            section = Section.find(itemObj.section_id)
            aisle = Aisle.find(section.aisle_id)
            store = Store.find(aisle.store_id)
            itemHash[:name] = itemObj.title
            itemHash[:section] = section.section_number
            itemHash[:aisle] = aisle.aisle_number
            itemHash[:store] = store.name
            items.push(itemHash)
          end
          inner[:items] = items
          out.push(inner)
        end
        return out
      end
    end
  end
end