# == Schema Information
#
# Table name: holes
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  address     :string           not null
#  url         :string
#  description :text
#  region_id   :bigint(8)        not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Hole < ApplicationRecord
  belongs_to :region
  has_many :concert
end
