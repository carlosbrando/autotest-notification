require 'optparse'

module AnInstall
  class CLI
    def self.execute(stdout, arguments=[])

      # NOTE: the option -p/--path= is given as an example, and should be replaced in your application.

      options = {
        :path     => '~',
        :speaking => false,
        :doom => false,
        :sticky => false,
        :pending => false,
        :buuf => false
      }
      mandatory_options = %w(  )

      parser = OptionParser.new do |opts|
        opts.banner = <<-BANNER.gsub(/^          /,'')
          This application is wonderful because...

          Usage: #{File.basename($0)} [options]

          Options are:
        BANNER
        opts.separator ""
        opts.on("-p", "--path=PATH", String,
                "This is a sample message.",
                "For multiple lines, add more strings.",
                "Default: ~") { |arg| options[:path] = arg }
        opts.on("-s", "--speaking",
                "If a test failed, the computer will speak.",
                "For all plataforms.") { options[:speaking] = true }
        opts.on("-d", "--doom",
                "Special Doom Edition.",
                "Only for Mac.") { options[:doom] = true }
        opts.on("-b", "--buuf",
                "Special Buuf Images.",
                "For all platforms") { options[:buuf] = true }
        opts.on("--pending",
                "Shows a different image when there are no errors/failures",
                "but there are pending specs. Only for Mac.") { options[:pending] = true }
        opts.on("--sticky",
                "Keep notification on screen in case of errros/failures or pending specs.",
                "Only for Mac.") { options[:sticky] = true }
        opts.on("-h", "--help",
                "Show this help message.") { stdout.puts opts; exit }
        opts.parse!(arguments)

        if mandatory_options && mandatory_options.find { |option| options[option.to_sym].nil? }
          stdout.puts opts; exit
        end
      end

      path = options[:path]

      autotest_path = File.expand_path(path)

      if File.exists?("#{autotest_path}/.autotest")
        puts "\nYou Already have a .autotest file, renamed to .autotest.backup"
        FileUtils.cp "#{autotest_path}/.autotest", "#{autotest_path}/.autotest.backup"
      end

      f = File.new("#{autotest_path}/.autotest",  "w")
      f.write "# ~.autotest\n"
      f.write "require 'autotest_notification'\n"
      f.write("SPEAKING = #{options[:speaking]}\n")
      f.write("DOOM_EDITION = #{options[:doom]}\n")
      f.write("BUUF = #{options[:buuf]}\n")
      f.write("PENDING = #{options[:pending]}\n")
      f.write("STICKY = #{options[:sticky]}\n")
      f.close

      puts "\nAs from now all tests will be notified automatically."
      puts "" # a blank line
    end
  end
end
