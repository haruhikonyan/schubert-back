# == Schema Information
#
# Table name: composers
#
#  id           :bigint(8)        not null, primary key
#  display_name :string           not null
#  full_name    :string
#  description  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Composer < ApplicationRecord
  has_many :composer_countries
  has_many :countries, :through => :composer_countries
  has_many :tunes

end
