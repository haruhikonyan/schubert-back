# == Schema Information
#
# Table name: tunes
#
#  id          :bigint(8)        not null, primary key
#  title       :string           not null
#  description :text
#  composer_id :bigint(8)        not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class TuneTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
