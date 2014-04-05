module Notifier
  class Base
    @@registered = []

    def initialize
      register
    end

    def register
      @@registered << self
    end

    def notify!
      @@registered.each { |n| n.notify if n.respond_to?(:notify) }
    end
  end

end
