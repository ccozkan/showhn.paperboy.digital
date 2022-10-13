class ServiceResponse
  attr_reader :payload, :error

  class PayloadAndErrorPresenceInconsistency < StandardError; end

  def initialize(payload: nil, error: nil)
    @payload = payload
    @error = error

    raise PayloadAndErrorPresenceInconsistency if inconsistent?
  end

  def success?
    !!@payload && !@error
  end

  private

  def inconsistent?
    @payload && @error || !@payload && !@error
  end
end
