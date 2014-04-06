require_relative './registry'

module Notifier

  class Base
    include Registry::Registerable

    def settings
      CampaignNotifier.settings
    end

  end

end
