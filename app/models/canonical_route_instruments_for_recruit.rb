# == Schema Information
#
# Table name: canonical_route_instruments_for_recruits
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CanonicalRouteInstrumentsForRecruit < ApplicationRecord
  has_one :canonical_route, :as => :canonical_routable

  has_many :canonical_route_instruments_for_recruits_relations
  has_many :instruments, :through => :canonical_route_instruments_for_recruits_relations
end
