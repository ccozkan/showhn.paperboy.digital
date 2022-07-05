# frozen_string_literal: true

module Middleware
  class HealthCheck
    def initialize(app)
      @app = app
    end

    def call(env)
      request_started_on = Time.current
      status, headers, response = @app.call(env)
      request_ended_on = Time.current
      duration = request_ended_on - request_started_on

      modified_response = JSON.parse(response.first)
      modified_response['duration'] = duration.to_s
      response = [modified_response.to_json]

      [status, headers, response]
    end
  end
end
