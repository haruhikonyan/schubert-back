module Jwt
  class TokenProvider
    class << self

      # jwt token の有効期間
      JWT_TOKEN_EXPIRATION_DATE = Time.now + 1.week
      
      def decode(token)
        JWT.decode token, nil, false
      end

      def refresh_token(team)
        Jwt::TokenProvider.create_token team.id.to_s
      end

      def create_token(team_id)
        payload = { team_id: team_id, exp: JWT_TOKEN_EXPIRATION_DATE.to_i }
        issue_token payload
      end

      private
      def issue_token(payload)
        JWT.encode payload, nil, 'none'
      end
    end
  end
end