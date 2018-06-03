# == Schema Information
#
# Table name: concert_conductors
#
#  id           :bigint(8)        not null, primary key
#  concert_id   :uuid             not null
#  conductor_id :bigint(8)        not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ConcertConductor < ApplicationRecord
  belongs_to :concert
  belongs_to :conductor
end
