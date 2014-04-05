require 'json'
require_relative '../spec_helper'
require_relative '../../lib/event'

describe Event do
  subject { Event.new({type: "ping"}.to_json) }

  it "has a message method" do
    subject.respond_to?(:message).should be(true)
  end
end
