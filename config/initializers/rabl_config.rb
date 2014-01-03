Rabl.configure do |config|
  config.include_json_root = false
  config.include_child_root = false
  config.enable_json_callbacks = false
  config.cache_sources = Rails.env != 'development'
  #config.cache_all_output = Rails.env != 'development'
end
