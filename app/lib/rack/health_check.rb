# frozen_string_literal: true

module Rack
  class HealthCheck
    def call(_env)
      health_status = check_health_status

      [
        health_status == "OK" ? 200 : 503,
        { "Content-Type" => "application/json" },
        [health_status],
      ]
    end

    private

    def database_connected?
      ApplicationRecord.connection.select_value("SELECT 1") == 1
    rescue StandardError
      false
    end

    def redis_connected?
      Redis.new.ping == "PONG"
    rescue StandardError
      false
    end

    def check_health_status
      @database_connection_status = database_connected?
      @redis_connection_status = redis_connected?

      if @database_connection_status && @redis_connection_status
        "OK"
      else
        "KO"
      end
    end
  end
end
