RailsLiveReload.configure do |config|
  config.watch %r{app/components/.+\.(erb|haml|slim)$}, reload: :always
  config.watch %r{app/views/.+\.(erb|haml|slim)$}, reload: :always
  config.watch %r{(app|vendor)/(assets|javascript)/\w+/(.+\.(css|js|html|png|jpg|ts|jsx)).*}, reload: :always
end if defined?(RailsLiveReload)
