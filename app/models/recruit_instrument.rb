# == Schema Information
#
# Table name: recruit_instruments
#
#  id            :bigint(8)        not null, primary key
#  recruit_id    :uuid             not null
#  instrument_id :bigint(8)        not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class RecruitInstrument < ApplicationRecord
  belongs_to :recruit
  belongs_to :instrument
end
