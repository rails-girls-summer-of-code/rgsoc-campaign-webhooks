class Registry
  attr_reader :registered

  def initialize
    @registered = []
  end

  def register(registrant)
    registered << registrant
  end

  def process!(payload)
    registered.each { |n| n.process(payload) if n.respond_to?(:process) }
  end
end
