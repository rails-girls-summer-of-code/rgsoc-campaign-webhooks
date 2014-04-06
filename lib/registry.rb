class Registry
  attr_reader :registered

  def initialize
    @registered = []
  end

  def register(notifier)
    registered << notifier
  end

  def notify!(msg)
    registered.each { |n| n.notify(msg) if n.respond_to?(:notify) }
  end
end
