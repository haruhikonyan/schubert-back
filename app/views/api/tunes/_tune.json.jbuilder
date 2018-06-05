json.extract! tune, *(Tune.attribute_names - ['composer_id', 'created_at', 'updated_at'])
json.composer do
  json.partial! "api/composers/composer", composer: tune.composer
end
