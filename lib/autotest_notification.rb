$:.unshift(File.dirname(__FILE__))
require 'autotest_notification/linux'
require 'autotest_notification/windows'
require 'autotest_notification/cygwin'
require 'autotest/growl'

module AutotestNotification
  FAIL    = -1
  PENDING = 0
  SUCCESS = 1

  EXPIRATION_IN_SECONDS = 3

  IMAGES_DIRECTORY = File.expand_path(File.dirname(__FILE__) + "/../images/")
  SUCCESS_IMAGE    = "#{IMAGES_DIRECTORY}/pass.png"
  FAIL_IMAGE       = "#{IMAGES_DIRECTORY}/fail.png"

  Autotest.add_hook :ran_command do |at|

    result = at.results.is_a?(Array) ? at.results.last : at.results.split("\n").last

    if result

      # Test::Unit
      tests      = result =~ /(\d+) test/ ? $1.to_i : 0
      assertions = result =~ /(\d+) assertion/ ? $1.to_i : 0
      errors     = result =~ /(\d+) error/ ? $1.to_i : 0

      # RSpec
      examples   = result =~ /(\d+) example/ ? $1.to_i : 0
      pendings   = result =~ /(\d+) pending/ ? $1.to_i : 0

      # Shared
      failures   = result =~ /(\d+) failure/ ? $1.to_i : 0

      code = 32
      msg = if result =~ /test/
        code = 31 if failures > 0 || errors > 0
        "#{pluralize('test', tests)}, #{pluralize('assertion', assertions)}, #{pluralize('failure', failures)}, #{pluralize('error', errors)}"
      else
        code = (failures > 0) ? 31 : (pendings > 0) ? 33 : 32
        "#{pluralize('example', examples)}, #{pluralize('failure', failures)}, #{pendings} pending"
      end

      if failures > 0 || errors > 0
        notify "FAIL", msg, FAIL_IMAGE, 2
      else
        notify "Pass", msg, SUCCESS_IMAGE
      end

      puts "\e[#{code}m#{'=' * 80}\e[0m\n\n"
    end
  end

  class << self
    def notify(title, msg, img = SUCCESS_IMAGE, pri = 0)
      case RUBY_PLATFORM
      when /linux/
        Linux.notify(title, msg, img)
      when /darwin/
        Autotest::Growl.growl title, msg, pri, img
      when /cygwin/
        Cygwin.notify(title, msg, img)
      when /mswin/
        Windows.notify(title, msg, img)
      end
    end

    def pluralize(text, number)
      "#{number} #{text}#{'s' if number != 1}"
    end
  end
end
