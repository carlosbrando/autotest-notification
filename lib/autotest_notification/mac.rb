module AutotestNotification
  class Mac
    class << self
      def notify(title, msg, img, failures = 0, pri = 0)
        system "growlnotify -n autotest --image #{img} -p #{pri} -m '#{msg}' #{title}"
        system("say #{failures} test#{'s' unless failures == 1} failed.") if SPEAKING && failures > 0
      end
    end
  end
end
