class Conductor < ApplicationRecord
  has_many :concert_conductors
  has_many :concerts, :through => :concert_conductors
end
