class InformationReceiver
  require 'httparty'

  def initialize(params)
    @foo = params[:bar]
  end

  def call
    url = 'https://random.dog/woof.json'
    result = HTTParty.get(url)
  rescue HTTParty::Error => e
    OpenStruct.new({ success?: false, error: e })
  else
    OpenStruct.new({ success?: true, payload: result })
  end
end
