class CanonicalRouteRegionForRecruit < ApplicationRecord
  has_one :canonical_route, :as => :canonical_routable
end
