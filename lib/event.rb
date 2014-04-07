class Event
  include Registry::Registerable

  def process(msg)
    msg.to_s
  end
end
