class Solist < ApplicationRecord
  has_many :solist_repertoires
  has_many :repertoires, :through => :solist_repertoires
  belongs_to :instrument
end
