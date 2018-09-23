# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # , 区切りのドメインが指定されることを前提 設定が一つでよければそのまま代入に戻す
    allow_origin_list = Rails.application.config.cors_allowed_origins.split(",")
    origins *allow_origin_list

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
      # TODO 正しいドメインを設定したらコメントアウトを外す
      #　origins を * だとエラーが出る
      # ,credentials: true
  end
end
