# == Schema Information
#
# Table name: recruits
#
#  id             :uuid             not null, primary key
#  title          :string           not null
#  practice_place :string
#  practice_time  :string
#  description    :text
#  published_from :datetime         not null
#  published_to   :datetime         not null
#  team_id        :uuid             not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  concert_id     :uuid
#

class Recruit < ApplicationRecord
  belongs_to :team
  accepts_nested_attributes_for :team
  has_many :recruit_instruments
  has_many :instruments, :through => :recruit_instruments

  belongs_to :concert, required: false

  scope :has_instrument_ids, -> instrument_ids {
    joins(:instruments).where('instruments.id IN (?)', instrument_ids)
  }

  scope :has_type_ids, -> type_ids {
    joins(team: :types).where('types.id IN (?)', type_ids)
  }

  scope :has_region_ids, -> region_ids {
    joins(team: :regions).where('regions.id IN (?)', region_ids)
  }
  # もっとスマートにかける？
  scope :is_published, -> {
    now = DateTime.now
    where("published_from <= ?", now).where("published_to >= ?", now)
  }

  # 複数キーワード検索(仮)
  # ゆくゆくは ES 入れたい
  scope :search_free_words, -> words {
    recruits = []
    # see https://qiita.com/nao58/items/bf5d017a06fc33da9e3b
    words.split(/[[:blank:]]+/).each_with_index do |word, index|
      if index == 0
        recruits = Recruit.search_free_word(word)
      else
        recruits = recruits.search_free_word(word)
      end
      break if recruits.blank?
    end
    recruits
  }

  # 単体キーワード検索
  scope :search_free_word, -> word {
    w = "%#{word}%"
    joins(:team).where("(recruits.title LIKE ?) or (recruits.description LIKE ?) or (recruits.practice_place LIKE ?) or (recruits.practice_time LIKE ?) or (teams.name LIKE ?)", w, w, w, w, w)
  }
end
