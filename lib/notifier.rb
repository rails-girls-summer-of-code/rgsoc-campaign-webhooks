require_relative './registry'

class Notifier
  include Registry::Registerable

  def settings
    CampaignNotifier.settings
  end
end
