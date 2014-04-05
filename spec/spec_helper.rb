require 'rack/test'

require File.expand_path '../../app.rb', __FILE__
Dir["./spec/support/**/*.rb"].sort.each {|f| require f}

module RSpecMixin
  include Rack::Test::Methods
  def app() described_class end
end

RSpec.configure { |c| c.include RSpecMixin }
