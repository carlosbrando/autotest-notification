module AutotestNotification
  class Linux
    class << self

      def notify(title, msg, img, total = 1, failures = 0, priority = 0)
        Config.expiration_in_seconds = 0 if failures > 0 && STICKY

        if has_notify?
          notify_send(title, msg, img, priority)
        elsif has_zenity?
          zenity(title, msg, img)
        elsif has_kdialog?
          kdialog(title, msg, img)
        end

        say(total, failures) if SPEAKING
      end

      protected

        def has_notify?
          system "which notify-send > /dev/null 2>&1"
        end
      
        def has_kdialog?
          system "which kdialog > /dev/null 2>&1"
        end
      
        def has_zenity?
          system "which zenity > /dev/null 2>&1"
        end
        
        def notify_send(title, msg, img, priority = 0)
          urgency = priority > 1 ? 'critical' : priority < 0 ? 'low' : 'normal'
          system "notify-send -t #{Config.expiration_in_seconds * 1000} -i #{img} -u #{urgency} '#{title}' '#{msg}'"
        end

        def kdialog(title, msg, img)
          system "kdialog --title '#{title}' --passivepopup '<img src=\"#{img}\" align=\"middle\"> #{msg}' #{Config.expiration_in_seconds}"
        end

        def zenity(title, msg, img)
          system "zenity --info --text='#{msg}' --title='#{title}'"
        end

        def say(total, failures)
          if failures > 0
            DOOM_EDITION ? Doom.play_sound(total, failures) : system("/usr/bin/espeak '#{failures} test#{'s' unless failures == 1} failed'")
          else
            DOOM_EDITION ? Doom.play_sound(total, failures) : system("/usr/bin/espeak 'All tests passed successfully'")
          end
        rescue
          puts "You need the #{DOOM_EDITION ? 'mplayer' : 'espeak'} installed to hear the sounds."
        end
        
    end
  end
end
