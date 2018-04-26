class ApplicationController < ActionController::API
  protected

    # Snakeize JSON API request params
    # ref. https://qiita.com/vochicong/items/d64f3b3d5a448a3b1f42
    def snakeize_params
      params.deep_snakeize!
    end
end
