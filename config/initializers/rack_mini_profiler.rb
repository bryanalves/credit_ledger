if defined?(Rack::MiniProfiler)
  Rack::MiniProfiler.config.position = 'right'
  Rack::MiniProfiler.config.start_hidden = true
end
