require_relative '../spec_helper'
require_relative '../../lib/registry'

describe Notifier::Base do
  subject        { Registry::Base.new }
  let(:notifier) { Notifier::Base.new }

  describe "register" do
    it "increases the Registry.registered size" do
      lambda do
        subject.register(notifier)
      end.should change(subject.registered, :size).by(1)
    end

    it "return the registry" do
      subject.register(notifier).should be(subject)
    end
  end

  describe "registerables" do
    it "sets registerables when initialising with one" do
      registry = Registry::Base.new("events")

      registry.registerables.should eq("events")
    end

    it "calls require_registerables when initialising with one" do
      Registry::Base.any_instance.should_receive(:require_registerables)

      registry = Registry::Base.new("events")
    end
  end

  it "calls process on every registerable when calling process!" do
    subject.register(notifier)

    notifier.should_receive(:process)

    subject.process!("Test")
  end

end
