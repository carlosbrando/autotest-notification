module AutotestNotification
  class Buuf
    class << self
      def image(notification)
        "#{Config.images_directory}/buuf/#{notification}.png"
      end
    end
  end
end
