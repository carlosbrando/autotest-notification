module AutotestNotification
  class Buuf
    class << self
      def image(notification)
        "#{IMAGES_DIRECTORY}/buuf/#{notification}.png"
      end
    end
  end
end
