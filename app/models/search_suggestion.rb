class SearchSuggestion < ActiveRecord::Base
  def self.term_for(term)
  	suggestions = where("term like ?", "%#{term}%")
  	suggestions.order("popularity desc").limit(10).pluck(:term)
  end

  def self.index_products
  	Item.find_each do |item|
  	  index_term(item.title)
  	end
  end

  def self.index_term(term)
  	where(term: term.downcase).first_or_initialize.tap do |suggestion|
  	  suggestion.increment! :popularity
  	end
  end
end
