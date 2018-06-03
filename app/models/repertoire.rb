class Repertoire < ApplicationRecord
  belongs_to :concert
  belongs_to :tune
  has_many :solist_repertoires
  has_many :solists, :through => :solist_repertoires
end
