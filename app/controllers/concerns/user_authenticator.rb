module UserAuthenticator
  extend ActiveSupport::Concern

  included do
    attr_reader :current_team

    def authenticate!
      if token = bearer_token
        # TODO 不正な　token が取得できた際のエラーハンドリング
        # Jwt::TokenProvider.decode 'hoge'
        # JWT::DecodeError: Not enough or too many segments
        payload, _ = Jwt::TokenProvider.decode token

        @current_team = Team.find(payload['team_id'])
      end
    end

    def bearer_token
      pattern = /^Bearer /
      header = request.headers['Authorization']

      header.gsub(pattern, '') if header && header.match(pattern)
    end
  end
end