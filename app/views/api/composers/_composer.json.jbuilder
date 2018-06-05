json.extract! composer, *(Composer.attribute_names - ['created_at', 'updated_at'])
json.countries do
  json.partial! 'api/countries/country', collection: composer.countries, as: :country
end