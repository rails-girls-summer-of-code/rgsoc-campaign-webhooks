module Notifier

  def self.require_notifiers
    Dir["#{File.dirname(__FILE__)}/notifier/*.rb"].sort.each do |f|
      require f
      npc = File.basename(f).gsub('.rb', '').split('_').map { |fp| fp.capitalize }.join()
      Module.const_get(npc).new
    end
  end

  class Base
    @@registered = []

    def settings
      CampaignNotifier.settings
    end

    def initialize
      register
    end

    def register
      @@registered << self
    end

    def notify!(msg)
      @@registered.each { |n| n.notify(msg) if n.respond_to?(:notify) }
    end
  end

end
