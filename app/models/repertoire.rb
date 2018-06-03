# == Schema Information
#
# Table name: repertoires
#
#  id          :bigint(8)        not null, primary key
#  arranger    :string
#  description :text
#  concert_id  :uuid             not null
#  tune_id     :bigint(8)        not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Repertoire < ApplicationRecord
  belongs_to :concert
  belongs_to :tune
  has_many :solist_repertoires
  has_many :solists, :through => :solist_repertoires
end
