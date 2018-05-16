# == Schema Information
#
# Table name: teams
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  password_digest :string           not null
#  mail            :string
#  url             :string
#  description     :text
#  is_published    :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Team < ApplicationRecord
  # SecurePassword有効
  has_secure_password

  has_many :recruits
  has_many :team_types
  has_many :types, :through => :team_types
  has_many :team_regions
  has_many :regions, :through => :team_regions

  scope :is_public, -> {
    where(is_public: true)
  }

  # 自分自身のパスワードと一致すれば token を返す
  def login(password)
    if self.authenticate(password)
      payload = { team_id: self.id }
    
      JWT.encode payload, nil, 'none'
  
    else
      false
    end
  end

  # 受け取った token の id と自分の id が一致すれば認証成功とし、true を返す
  def auth(token)
    # Set password to nil and validation to false otherwise this won't work
    decoded_token = JWT.decode token, nil, false
    # もっと良いtokenからのidの取得方法があるはず
    decoded_token.first["team_id"] == self.id
  end
end
