# == Schema Information
#
# Table name: solists
#
#  id            :bigint(8)        not null, primary key
#  name          :string           not null
#  url           :string
#  description   :text
#  instrument_id :bigint(8)        not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class SolistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
