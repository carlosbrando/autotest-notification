module AutotestNotification
  class Mac
    class << self
      def notify(title, msg, img, pri = 0)
        system "growlnotify -n autotest --image #{img} -p #{pri} -m '#{msg}' #{title}"
      end
    end
  end
end
