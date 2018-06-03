# == Schema Information
#
# Table name: conductors
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  description :string
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Conductor < ApplicationRecord
  has_many :concert_conductors
  has_many :concerts, :through => :concert_conductors
end
