require_relative '../spec_helper'
require_relative '../../lib/notifier'

class TestNotifier < Notifier::Base; end

describe Notifier::Base do
  let(:registry) { Registry.new }
  subject        { Notifier::Base.new(registry) }

  it "increases the Registry.registered size" do
    -> {
      Notifier::Base.new(registry)
    }.should change(registry.registered, :size).by(1)
  end

  describe "#notify!" do
    it "calls notify on ever registered Notifier" do
      notifier         = TestNotifier.new(registry)
      another_notifier = TestNotifier.new(registry)

      notifier.should_receive(:notify).with("Test Message")
      another_notifier.should_receive(:notify).with("Test Message")

      registry.notify!("Test Message")
    end
  end

end
