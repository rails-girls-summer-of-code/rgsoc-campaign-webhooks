require File.expand_path '../../spec_helper.rb', __FILE__

describe Notifier::Base do

  describe "#register" do
    it "adds the class to the notifier array" do
      -> { subject.register }.should change(subject.class.class_eval('@@registered'), :size)
    end
  end

  describe "#notify!" do
    it "calls notify on ever registered Notifier" do
      notifier = TestNotifier.new

      notifier.should_receive(:notify)

      subject.notify!
    end
  end

end
