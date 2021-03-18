class RequestMakerService
  require 'httparty'

  def initialize(url)
    @url = url
  end

  def call
    result = HTTParty.get(@url)
  rescue HTTParty::Error => e
    OpenStruct.new({ success?: false, error: e })
  rescue SocketError => e
    OpenStruct.new({ success?: false, error: e })
  else
    OpenStruct.new({ success?: true, payload: result })
  end
end
