module AutotestNotification
  class Doom
    class << self
      def image(total, failures)
        "#{IMAGES_DIRECTORY}/doom/doom_#{percent(total, failures)}.png"
      end

      def play_sound(total, failures)
        `#{File.expand_path(File.dirname(__FILE__) + "/../../bin/")}/playsound #{File.expand_path(File.dirname(__FILE__) + "/../../sounds/doom/")}/#{percent(total, failures)}.wav`
      end

      private
        def percent(total, failures)
          percent = failures.zero? ? 0 : ((5 * failures) / total) + 1
        end
    end
  end
end
