module AutotestNotification
  class Linux
    class << self

      def notify(title, msg, img, total=1, failures=0)
        if has_notify?
          notify_send(title, msg, img)
        elsif has_zenity?
          zenity(title, msg, img)
        elsif has_kdialog?
          kdialog(title, msg, img)
        end

        talk(msg, total, failures) if SPEAKING
      end

      protected
        def notify_send(title, msg, img)
          system "notify-send -t #{EXPIRATION_IN_SECONDS * 1000} -i #{img} '#{title}' '#{msg}'"
        end

        def kdialog(title, msg, img)
          system "kdialog --title '#{title}' --passivepopup '#{msg}' #{EXPIRATION_IN_SECONDS}"
        end

        def zenity(title, msg, img)
          system "zenity --info --text='#{msg}' --title='#{title}'"
        end

        def talk(msg, total, failures)
          # TODO: check if user has espeak and mplayer installed
          begin
            if failures > 0
              DOOM_EDITION ? Doom.mplayer_sound(total, failures) : system("/usr/bin/espeak '#{failures} test#{'s' unless failures == 1} failed'")
            else
              DOOM_EDITION ? Doom.mplayer_sound(total, failures) : system("/usr/bin/espeak 'All tests passed successfully'")
            end
          rescue
          end
        end

        def has_zenity?
          system "which zenity 2> /dev/null"
        end

        def has_notify?
          system "which notify-send 2> /dev/null"
        end

        def has_kdialog?
          system "which kdialog 2> /dev/null"
        end
    end
  end
end
