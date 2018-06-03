# == Schema Information
#
# Table name: concerts
#
#  id           :uuid             not null, primary key
#  title        :string           not null
#  date         :date             not null
#  doors_open   :time
#  cirtain_time :time             not null
#  description  :text
#  team_id      :uuid             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class ConcertTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
