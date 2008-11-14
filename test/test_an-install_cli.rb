require File.join(File.dirname(__FILE__), "test_helper.rb")
require 'an_install/cli'

class TestAnInstallCli < Test::Unit::TestCase
  def setup
    @stdout_io = StringIO.new
    AnInstall::CLI.execute(@stdout_io, [])
    @stdout_io.rewind
    @stdout = @stdout_io.read
  end
  
  def test_not_print_default_output
    assert_no_match(/To update this executable/, @stdout)
  end
  
  # def test_print_successful_message
  #   assert_match(/As from now all tests will be notified automatically/, @stdout)
  # end
end