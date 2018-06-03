class ConcertConductor < ApplicationRecord
  belongs_to :concert
  belongs_to :conductor
end
