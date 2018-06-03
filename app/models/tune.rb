class Tune < ApplicationRecord
  belongs_to :composer
  has_many :repertoires
end
