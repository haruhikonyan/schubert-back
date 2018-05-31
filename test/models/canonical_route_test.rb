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
#  orderInCategory         :integer
#  isListedOnTop           :boolean
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

require 'test_helper'

class CanonicalRouteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
