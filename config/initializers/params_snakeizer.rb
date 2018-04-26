# Transform JSON request param keys from JSON-conventional camelCase to
# Rails-conventional snake_case
# 
# ref. https://qiita.com/vochicong/items/d64f3b3d5a448a3b1f42
module ActionController
  # Modified from action_controller/metal/strong_parameters.rb
  class Parameters
    def deep_snakeize!
      @parameters.deep_transform_keys!(&:underscore)
      self
    end
  end
end

