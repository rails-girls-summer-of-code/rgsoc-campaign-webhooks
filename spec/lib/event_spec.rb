require 'json'
require_relative '../spec_helper'
require_relative '../../lib/event'

describe Event do
  subject { Event.new() }

  it "has a process method" do
    subject.respond_to?(:process).should be(true)
  end
end
