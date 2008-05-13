module AutotestNotification
  class Cygwin
    class << self
      def notify(title, msg, img)
        img = `cygpath -m #{img}` if RUBY_PLATFORM =~ /cygwin/
        img.strip!

        system "sncmd /m '#{title}' '#{msg}' '#{img}' /t #{EXPIRATION_IN_SECONDS}"
      end
    end
  end
end
