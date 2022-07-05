# frozen_string_literal: true

module Middleware
  class HealthCheck
    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)
      [status, headers, response]
    end
  end
end
