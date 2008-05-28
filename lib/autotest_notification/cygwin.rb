module AutotestNotification
  class Cygwin
    class << self
      def notify(title, msg, img)
        img = get_image_path(img).strip
        system "sncmd /m '#{title}' '#{msg}' '#{img}' /t #{EXPIRATION_IN_SECONDS}"
      end
      
      def get_image_path(img)
        `cygpath -m #{img}`
      end
    end
  end
end
