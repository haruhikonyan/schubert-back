class Country < ApplicationRecord
  has_many :composer_countries
  has_many :composer, :through => :composer_countries
end
