class Item < ActiveRecord::Base
  belongs_to :section

  def self.byItemName(name)
  	return Item.where('LOWER(title) = ?',name.downcase).first
  end

  def self.allForName(name)
  	return Item.where('LOWER(name) = ?',name.downcase)
  end
end
