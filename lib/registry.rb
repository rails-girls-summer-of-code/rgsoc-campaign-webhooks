module Registry
  class Base
    attr_reader :registered,
                :registerables

    def initialize(registerables = nil)
      @registered = []

      if registerables
        @registerables = registerables
        require_registerables
      end
    end

    def register(registrant)
      @registered << registrant

      self
    end

    def require_registerables
      Dir["#{File.dirname(__FILE__)}/#{@registerables}/*.rb"].sort.each do |f|
        require f
        npc = File.basename(f).gsub('.rb', '').split('_').map { |fp| fp.capitalize }.join
        Module.const_get(npc).new(self)
      end
    end

    def process!(payload)
      @registered.each { |n| n.process(payload) if n.respond_to?(:process) }
    end
  end

  module Registerable
    attr_accessor :registry

    def initialize(registry=nil)
      @registry = registry.register(self) if registry
      super()
    end
  end
end
