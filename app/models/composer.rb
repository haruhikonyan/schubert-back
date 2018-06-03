class Composer < ApplicationRecord
  has_many :composer_countries
  has_many :countries, :through => :composer_countries
  has_many :tunes

end
