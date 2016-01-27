class Aisle < ActiveRecord::Base
  belongs_to :store
  has_many :sections
end
