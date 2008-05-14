require File.dirname(__FILE__) + '/test_helper.rb'

class TestAutotestNotification < Test::Unit::TestCase
  
  def setup
    @title = "title"
    @msg   = "message"
    @image = "image"
    @pri   = 1
  end
  
  def test_notify_when_os_is_cygwin
    AutotestNotification::Cygwin.expects(:notify).with(@title, @msg, @image)
    verify_to("cygwin")
  end
  
  def test_notify_when_os_is_windows
    AutotestNotification::Windows.expects(:notify).with(@title, @msg, @image)
    verify_to("mswin")
  end
  
  def test_notify_when_os_is_linux
    AutotestNotification::Linux.expects(:notify).with(@title, @msg, @image)
    verify_to("linux")
  end
  
  def test_notify_when_os_is_mac
    AutotestNotification::Mac.expects(:notify).with(@title, @msg, @image, @pri)
    verify_to("darwin")
  end
  
  private
  def verify_to(so)
    AutotestNotification.const_set("RUBY_PLATFORM", so)
    AutotestNotification.notify(@title, @msg, @image, @pri)
  end
  
end
