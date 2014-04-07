module Configurable
  def settings
    CampaignNotifier.settings
  end

  def identifier
    self.to_s.split(/(?=[A-Z])/)[0].downcase
  end

  def namespace
    self.to_s.split(/(?=[A-Z])/)[1].downcase
  end

  def configurable(*args)
    args.each do |attribute|
      define_method(attribute) do
        self.class.settings.send(self.class.namespace)[self.class.identifier][attribute]
      end
    end
  end
end
