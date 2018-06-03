# == Schema Information
#
# Table name: conductors
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  description :string
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ConductorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
