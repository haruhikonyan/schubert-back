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

class Tune < ApplicationRecord
  belongs_to :composer
  has_many :repertoires
end
