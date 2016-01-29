class ListItem < ActiveRecord::Base
  belongs_to :shopping_list
  belongs_to :item
end
