$:.unshift(File.dirname(__FILE__))
require 'linux'

module AutotestNotification

  # FreeBSD specifics; using Linux behavior as a base.
  class FreeBSD < Linux
    class << self

        def say(total, failures)
          if failures > 0
            DOOM_EDITION ? Doom.play_sound(total, failures) : system("/usr/local/bin/espeak '#{failures} test#{'s' unless failures == 1} failed'")
          else
            DOOM_EDITION ? Doom.play_sound(total, failures) : system("/usr/local/bin/espeak 'All tests passed successfully'")
          end
        rescue
          puts "You need the #{DOOM_EDITION ? 'mplayer' : 'espeak'} installed to hear the sounds."
        end

    end
  end
end
