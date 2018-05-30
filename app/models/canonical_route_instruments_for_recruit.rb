class CanonicalRouteInstrumentsForRecruit < ApplicationRecord
  has_one :canonical_routes, :as => :canonical_routable

  has_many :canonical_route_instruments_for_recruits_relations
  has_many :instruments, :through => :canonical_route_instruments_for_recruits_relations
end
