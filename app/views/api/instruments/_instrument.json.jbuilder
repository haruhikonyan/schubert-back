json.extract! instrument, *(Instrument.attribute_names - ['instrument_category_id', 'created_at', 'updated_at'])
json.instrument_category do
  json.partial! "api/instrument_categories/instrument_category", instrument_category: instrument.instrument_category
end