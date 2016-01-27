class Section < ActiveRecord::Base
  belongs_to :aisle
  has_many :items
end
