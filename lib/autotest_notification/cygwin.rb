module AutotestNotification
  class Cygwin
    @last_test_failed = false

    class << self
      def notify(title, msg, img, total = 1, failures = 0)
        img = get_image_path(img).strip
        system "sncmd /m '#{title}' '#{msg}' '#{img}' /t #{Config.expiration_in_seconds}"
        play(SUCCESS_SOUND) if AutotestNotification.const_defined?("SUCCESS_SOUND") && !SUCCESS_SOUND.empty? && failures == 0
        play(FAILURE_SOUND) if AutotestNotification.const_defined?("FAILURE_SOUND") && !FAILURE_SOUND.empty? && failures > 0
        say(total, failures) if DOOM_EDITION
      end
      
      def get_image_path(img)
        `cygpath -m #{img}`
      end

      def say(total, failures)
        if failures > 0
          Doom.play_sound(total, failures)
          @last_test_failed = true
        elsif @last_test_failed
          Doom.play_sound(total, failures)
          @last_test_failed = false
        end
      end

      def play(sound_file)
        system "cp #{sound_file} /dev/dsp"
      end

    end
  end
end
