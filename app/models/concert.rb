# == Schema Information
#
# Table name: concerts
#
#  id           :uuid             not null, primary key
#  title        :string           not null
#  date         :date             not null
#  doors_open   :time
#  cirtain_time :time             not null
#  description  :text
#  team_id      :uuid             not null
#  hole_id      :bigint(8)        not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Concert < ApplicationRecord
  belongs_to :team
  accepts_nested_attributes_for :team
  belongs_to :hole
  has_many :concert_conductors
  has_many :conductors, :through => :concert_conductors
  has_many :repertoires
  accepts_nested_attributes_for :repertoires, allow_destroy: true
end
