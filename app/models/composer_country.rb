class ComposerCountry < ApplicationRecord
  belongs_to :composer
  belongs_to :country
end
