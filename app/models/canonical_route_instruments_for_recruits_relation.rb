# == Schema Information
#
# Table name: canonical_route_instruments_for_recruits_relations
#
#  id                                         :bigint(8)        not null, primary key
#  canonical_route_instruments_for_recruit_id :bigint(8)        not null
#  instrument_id                              :bigint(8)        not null
#  created_at                                 :datetime         not null
#  updated_at                                 :datetime         not null
#

class CanonicalRouteInstrumentsForRecruitsRelation < ApplicationRecord
  belongs_to :canonical_route_instruments_for_recruit
  belongs_to :instrument
end
