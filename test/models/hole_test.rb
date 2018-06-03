# == Schema Information
#
# Table name: holes
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  address     :string           not null
#  url         :string
#  description :text
#  region_id   :bigint(8)        not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class HoleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
