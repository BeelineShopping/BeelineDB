class Item < ActiveRecord::Base
  belongs_to :section

  def self.byItemName(name)
  	return Item.where(title: name)
  end
end
