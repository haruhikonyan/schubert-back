# == Schema Information
#
# Table name: solists
#
#  id            :bigint(8)        not null, primary key
#  name          :string           not null
#  url           :string
#  description   :text
#  instrument_id :bigint(8)        not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Solist < ApplicationRecord
  has_many :solist_repertoires
  has_many :repertoires, :through => :solist_repertoires
  belongs_to :instrument
end
