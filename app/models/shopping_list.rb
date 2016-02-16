class ShoppingList < ActiveRecord::Base
  belongs_to :app_user
  has_many :list_items

  def num_items_in_list
  	return list_items.length
  end
end
