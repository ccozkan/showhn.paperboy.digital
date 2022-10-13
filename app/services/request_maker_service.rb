class RequestMakerService
  require "httparty"

  def initialize(url)
    @url = url
  end

  def call
    result = HTTParty.get(@url)
  rescue HTTParty::Error => e
    ServiceResponse.new(error: e)
  rescue SocketError => e
    ServiceResponse.new(error: e)
  else
    ServiceResponse.new(payload: result)
  end
end
