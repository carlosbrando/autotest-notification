module AutotestNotification
  class Mac
    @last_test_failed = false

    class << self
      def notify(title, msg, img, failures = 0, pri = 0)
        system "growlnotify -n autotest --image #{img} -p #{pri} -m '#{msg}' #{title}"

        if SPEAKING && failures > 0
          system("say #{failures} test#{'s' unless failures == 1} failed.")
          @last_test_failed = true
        elsif @last_test_failed
          system("say All tests passed successfully.")
          @last_test_failed = false
        end
      end
    end
  end
end
