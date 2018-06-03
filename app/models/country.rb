# == Schema Information
#
# Table name: countries
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Country < ApplicationRecord
  has_many :composer_countries
  has_many :composer, :through => :composer_countries
end
