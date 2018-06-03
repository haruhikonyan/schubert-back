# == Schema Information
#
# Table name: team_types
#
#  id         :bigint(8)        not null, primary key
#  team_id    :uuid             not null
#  type_id    :bigint(8)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TeamType < ApplicationRecord
    belongs_to :team
    belongs_to :type
end
