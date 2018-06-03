# == Schema Information
#
# Table name: solist_repertoires
#
#  id            :bigint(8)        not null, primary key
#  solist_id     :bigint(8)        not null
#  repertoire_id :bigint(8)        not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class SolistRepertoireTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
