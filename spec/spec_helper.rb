ENV['RACK_ENV'] ||= 'test'

require 'rack/test'
require 'webmock/rspec'

module RSpecMixin
  include Rack::Test::Methods
  def app() described_class end
end

RSpec.configure { |c| c.include RSpecMixin }
