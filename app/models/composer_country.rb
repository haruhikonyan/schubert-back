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

class ComposerCountry < ApplicationRecord
  belongs_to :composer
  belongs_to :country
end
