module AutotestNotification
  class Doom
    class << self
      def image(total, failures)
        percent = failures.zero? ? 0 : ((5 * failures) / total) + 1
        "#{IMAGES_DIRECTORY}/doom/doom_#{percent}.png"
      end
    end
  end
end
