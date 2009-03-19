module AutotestNotification  
  class Doom
    class << self
      def image(total, failures)
        "#{Config.images_directory}/doom/doom_#{percent(total, failures)}.png"
      end

      def play_sound(total, failures)
        sound_file = "#{File.expand_path(File.dirname(__FILE__) + "/../../sounds/doom/")}/#{percent(total, failures)}.wav"

        case RUBY_PLATFORM
        when /darwin/
          `#{File.expand_path(File.dirname(__FILE__) + "/../../bin/")}/playsound #{sound_file}`
        when /linux/
          system("/usr/bin/mplayer #{sound_file} > /dev/null 2> /dev/null")
        when /cygwin/
          system "cp #{sound_file} /dev/dsp"
        end
      end

      private
        def percent(total, failures)
          percent = failures.zero? ? 0 : ((5 * failures) / total) + 1
        end
    end
  end  
end
