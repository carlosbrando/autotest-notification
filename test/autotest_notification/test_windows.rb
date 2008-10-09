require File.dirname(__FILE__) + '/../test_helper.rb'

class Snarl
end

class TestWindows < Test::Unit::TestCase
  
  def test_notify
    Snarl.expects(:show_message).with("title", "msg", "image")
    AutotestNotification::Windows.notify("title", "msg", "image")
  end
end