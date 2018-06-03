# == Schema Information
#
# Table name: team_regions
#
#  id         :bigint(8)        not null, primary key
#  team_id    :uuid             not null
#  region_id  :bigint(8)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TeamRegion < ApplicationRecord
    belongs_to :team
    belongs_to :region
end
