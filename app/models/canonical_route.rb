class CanonicalRoute < ApplicationRecord
  belongs_to :canonical_routable, polymorphic: true
end
