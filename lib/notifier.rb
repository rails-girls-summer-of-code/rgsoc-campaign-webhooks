require_relative './registry'
require_relative './configurable'

class Notifier
  extend Configurable
  include Registry::Registerable
end
