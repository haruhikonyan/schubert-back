class Concert < ApplicationRecord
  belongs_to :team
  accepts_nested_attributes_for :team
  has_many :concert_conductors
  has_many :conductors, :through => :concert_conductors
  has_many :repertoires
end
