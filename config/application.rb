require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SchubertBack
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    
    # config.cors_allowed_origins = ENV.fetch('CORS_ALLOWED_ORIGINS', 'schubert-front.haruhiko.work,schubert-front.herokuapp.com')
    # TODO 正しいドメイン設定
    config.cors_allowed_origins = ENV.fetch('CORS_ALLOWED_ORIGINS', '*')


    # api レスポンスをすべてキャメルケースに変換
    Jbuilder.key_format camelize: :lower
  end
end
