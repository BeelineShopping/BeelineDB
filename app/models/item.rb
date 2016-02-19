class Item < ActiveRecord::Base
  belongs_to :section

  def self.byItemName(name)
  	return Item.where('LOWER(title) = ?',name.downcase).first
  end
end
