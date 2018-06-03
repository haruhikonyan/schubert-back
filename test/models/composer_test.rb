# == Schema Information
#
# Table name: composers
#
#  id          :bigint(8)        not null, primary key
#  last_name   :string           not null
#  full_name   :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ComposerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
