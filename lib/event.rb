class Event
  attr_reader :payload

  def initialize(payload)
    @payload = payload
  end

  def message
    payload.to_s
  end

end
