# == Schema Information
#
# Table name: repertoires
#
#  id          :bigint(8)        not null, primary key
#  arranger    :string
#  description :text
#  concert_id  :uuid             not null
#  tune_id     :bigint(8)        not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class RepertoireTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
