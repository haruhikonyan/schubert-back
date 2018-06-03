# == Schema Information
#
# Table name: composer_countries
#
#  id          :bigint(8)        not null, primary key
#  composer_id :bigint(8)        not null
#  country_id  :bigint(8)        not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ComposerCountryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
