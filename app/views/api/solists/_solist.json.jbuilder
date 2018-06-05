json.extract! solist, *(Solist.attribute_names - ['instrument_id', 'created_at', 'updated_at'])
json.instrument do
  json.partial! "api/instruments/instrument", instrument: solist.instrument
end