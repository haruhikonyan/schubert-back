# == Schema Information
#
# Table name: canonical_route_region_for_recruits
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CanonicalRouteRegionForRecruit < ApplicationRecord
  has_one :canonical_route, :as => :canonical_routable
  belongs_to :region
end
