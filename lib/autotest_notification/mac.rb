module AutotestNotification
  class Mac
    @last_test_failed = false

    class << self
      
      def notify(title, msg, img, total = 1, failures = 0, pri = 0)
        system "growlnotify -n autotest --image #{img} -p #{pri} -m '#{msg}' #{title}"
        say(total, failures) if SPEAKING
      end

      def say(total, failures)

        if failures > 0
          DOOM_EDITION ? Doom.play_sound(total, failures) : system("say #{failures} test#{'s' unless failures == 1} failed.")
          @last_test_failed = true
        elsif @last_test_failed
          DOOM_EDITION ? Doom.play_sound(total, failures) : system("say All tests passed successfully.")
          @last_test_failed = false
        end
      end
      
    end
  end
end
