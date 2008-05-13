require 'snarl' if RUBY_PLATFORM =~ /mswin/

module AutotestNotification
  class Windows
    class << self
      def notify(title, msg, img)
        Snarl.show_message(title, msg, img)
      end
    end
  end
end
