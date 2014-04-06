require_relative '../spec_helper'
require_relative '../../lib/notifier'

class TestNotifier < Notifier::Base; end

describe Notifier::Base do
  let(:registry) { Registry::Base.new }
  subject        { Notifier::Base.new(registry) }

  it "increases the Registry.registered size" do
    lambda do
      Notifier::Base.new(registry)
    end.should change(registry.registered, :size).by(1)
  end

  describe "#notify!" do
    it "calls notify on ever registered Notifier" do
      notifier         = TestNotifier.new(registry)
      another_notifier = TestNotifier.new(registry)

      notifier.should_receive(:process).with("Test Message")
      another_notifier.should_receive(:process).with("Test Message")

      registry.process!("Test Message")
    end
  end

end
