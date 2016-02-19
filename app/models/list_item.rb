class ListItem < ActiveRecord::Base
  belongs_to :shopping_list
  belongs_to :item

  validates :item_id, :presence => true

  def item_name
  	return ""
  end
end
