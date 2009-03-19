$:.unshift(File.dirname(__FILE__))

module AutotestNotification
  class Config

    class << self
      attr_reader :images_directory
      attr_accessor :success_image, :fail_image, :pending_image, :expiration_in_seconds

      def images_directory=(path)
        @images_directory = File.expand_path(path)

        @success_image = "#{@images_directory}/pass.png"
        @fail_image    = "#{@images_directory}/fail.png"
        @pending_image = "#{@images_directory}/pending.png"
      end
    end

    self.images_directory = "#{File.dirname(__FILE__)}/../images/"

    self.expiration_in_seconds = 3

  end

  Autotest.add_hook :ran_command do |at|
    result = at.results.is_a?(Array) ? at.results.last : at.results.split("\n").last

    if result
      %w{ test assertion error example pending failure }.each { |x| instance_variable_set "@#{x}s", result[/(\d+) #{x}/, 1].to_i }

      case result
      when /test/
        code = 31 if @failures > 0 || @errors > 0
        msg  = unit_test_message(@tests, @assertions, @failures, @errors)
      when /example/
        code = (@failures > 0) ? 31 : (@pendings > 0) ? 33 : 32
        msg  = rspec_message(@examples, @failures, @pendings)
      else
        code = 31
        msg  = "1 exception occurred"
        @failures = 1
      end

      if @failures > 0 || @errors > 0
        notify "FAIL", msg, Config.fail_image, @tests + @examples, @failures + @errors, 2
      elsif PENDING && @pendings > 0
        notify "Pending", msg, Config.pending_image, @tests + @examples, @failures + @errors, 1
      else
        notify "Pass", msg, Config.success_image, @tests + @examples, 0, -2
      end

      puts "\e[#{code}m#{'=' * 80}\e[0m\n\n"
    end
  end

  class << self
    def notify(title, msg, img = Config.success_image, total = 1, failures = 0, priority = 0)

      img = Doom.image(total, failures) if DOOM_EDITION
      img = Buuf.image(title.downcase) if BUUF

      case RUBY_PLATFORM
      when /linux/
        Linux.notify(title, msg, img, total, failures, priority)
      when /darwin/
        Mac.notify(title, msg, img, total, failures, priority)
      when /cygwin/
        Cygwin.notify(title, msg, img, total, failures)
      when /mswin/
        Windows.notify(title, msg, img)
      end
    end

    def pluralize(text, number)
      "#{number} #{text}#{'s' if number != 1}"
    end

    def unit_test_message(tests, assertions, failures, errors)
      "#{pluralize('test', tests)}, #{pluralize('assertion', assertions)}, #{pluralize('failure', failures)}, #{pluralize('error', errors)}"
    end

    def rspec_message(examples, failures, pendings)
      "#{pluralize('example', examples)}, #{pluralize('failure', failures)}, #{pendings} pending"
    end
  end
end

%w{ linux mac windows cygwin doom buuf }.each { |x| require "autotest_notification/#{x}" }
