class ShoppingList < ActiveRecord::Base
  belongs_to :app_user
  has_many :list_items
end
