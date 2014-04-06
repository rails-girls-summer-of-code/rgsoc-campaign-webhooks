require_relative './registry'

module Notifier

  class Base
    attr_accessor :registry

    def settings
      CampaignNotifier.settings
    end

    def initialize(registry)
      @registry = registry
      registry.register(self)
    end
  end

  def self.require_and_register_notifiers
    registry = Registry.new

    Dir["#{File.dirname(__FILE__)}/notifier/*.rb"].sort.each do |f|
      require f
      npc = File.basename(f).gsub('.rb', '').split('_').map { |fp| fp.capitalize }.join()
      Module.const_get(npc).new(registry)
    end
  end

end
