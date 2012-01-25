$:.unshift(File.expand_path('..', File.dirname(__FILE__)))
require 'test_helper'

class Snarl
end

class TestWindows < Test::Unit::TestCase

  def test_notify
    Snarl.expects(:show_message).with("title", "msg", "image")
    AutotestNotification::Windows.notify("title", "msg", "image")
  end
end
