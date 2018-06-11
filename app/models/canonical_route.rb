# == Schema Information
#
# Table name: canonical_routes
#
#  id                      :bigint(8)        not null, primary key
#  canonical_routable_type :string
#  canonical_routable_id   :bigint(8)
#  path                    :string           not null
#  label                   :string           not null
#  category                :string           not null
#  order_in_Category       :integer
#  is_listed_on_top        :boolean          default(FALSE)
#  is_listed_on_model_top  :boolean          default(FALSE)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class CanonicalRoute < ApplicationRecord
  belongs_to :canonical_routable, polymorphic: true
  scope :has_category, -> category {
    where(category: category)
  }
  def search_recruits
    # CanonicalRouteInstrumentsForRecruit だった場合紐づく楽器の Recruits を返す
    return Recruit.has_instrument_ids(self.canonical_routable.instrument_ids) if self.canonical_routable_type == 'CanonicalRouteInstrumentsForRecruit'
    # CanonicalRouteRegionForRecruit だった場合紐づく地域の Recruits を返す
    return Recruit.has_region_ids([self.canonical_routable.region_id]) if self.canonical_routable_type == 'CanonicalRouteRegionForRecruit'
    # それ以外だったら空を返す
    retrun []
  end

  def search_concert
    # TODO 実装
    # それ以外だったら空を返す
    retrun []
  end
end
