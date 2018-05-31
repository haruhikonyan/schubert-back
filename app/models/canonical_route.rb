# == Schema Information
#
# Table name: canonical_routes
#
#  id                      :bigint(8)        not null, primary key
#  canonical_routable_type :string
#  canonical_routable_id   :bigint(8)
#  path                    :string
#  label                   :string
#  category                :string
#  order_in_Category       :integer
#  is_listed_on_top        :boolean
#  is_listed_on_model_top  :boolean
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class CanonicalRoute < ApplicationRecord
  belongs_to :canonical_routable, polymorphic: true
end
