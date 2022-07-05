# This file is used by Rack-based servers to start the application.

require_relative "config/environment"
require_relative "app/lib/rack/health_check"

run Rails.application
Rails.application.load_server

map "/health_check" do
  run Rack::HealthCheck.new
end
