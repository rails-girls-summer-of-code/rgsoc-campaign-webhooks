require_relative '../../spec_helper'
require_relative '../../../lib/notifier'
require_relative '../../../lib/notifier/slack_notifier'

describe SlackNotifier do
  it "has a notify method" do
    subject.respond_to?(:notify).should be(true)
  end

  describe '#notify' do
    it "sends a webhook to slack" do
      request = stub_request(:post, subject.hook_url)

      subject.notify("Test")

      request.should have_been_made
    end
  end
end
