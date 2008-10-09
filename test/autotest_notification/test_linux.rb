require File.dirname(__FILE__) + '/../test_helper.rb'

class TestLinux < Test::Unit::TestCase

  def setup
    turn_methods_public AutotestNotification::Linux
  end

  def test_notify_when_use_notify_without_speak
    Object.const_set :SPEAKING, false
    AutotestNotification::Linux.expects(:has_notify?).returns(true)
    verify_notify(:notify_send)
  end

  def test_notify_when_use_zenity_without_speak
    Object.const_set :SPEAKING, false
    AutotestNotification::Linux.expects(:has_notify?).returns(false)
    AutotestNotification::Linux.expects(:has_zenity?).returns(true)
    verify_notify(:zenity)
  end

  def test_notify_when_use_kdialog_without_speak
    Object.const_set :SPEAKING, false
    AutotestNotification::Linux.expects(:has_notify?).returns(false)
    AutotestNotification::Linux.expects(:has_zenity?).returns(false)
    AutotestNotification::Linux.expects(:has_kdialog?).returns(true)
    verify_notify(:kdialog)
  end

  def test_notify_when_use_notify_with_speak
    Object.const_set :SPEAKING, true
    AutotestNotification::Linux.expects(:has_notify?).returns(true)
    AutotestNotification::Linux.expects(:system).with("/usr/bin/espeak '1 test failed'")
    verify_notify(:notify_send)
  end

  def test_notify_when_use_zenity_with_speak
    Object.const_set :SPEAKING, true
    AutotestNotification::Linux.expects(:has_notify?).returns(false)
    AutotestNotification::Linux.expects(:has_zenity?).returns(true)
    AutotestNotification::Linux.expects(:system).with("/usr/bin/espeak '1 test failed'")
    verify_notify(:zenity)
  end

  def test_notify_when_use_kdialog_with_speak
    Object.const_set :SPEAKING, true
    AutotestNotification::Linux.expects(:has_notify?).returns(false)
    AutotestNotification::Linux.expects(:has_zenity?).returns(false)
    AutotestNotification::Linux.expects(:has_kdialog?).returns(true)
    AutotestNotification::Linux.expects(:system).with("/usr/bin/espeak '1 test failed'")
    verify_notify(:kdialog)
  end

  def test_notify_send
    AutotestNotification::Linux.expects(:system).with('notify-send -t 3000 -i image \'title\' \'msg\'')
    AutotestNotification::Linux.notify_send("title", "msg", "image")
  end

  def test_notify_kdialog
    AutotestNotification::Linux.expects(:system).with('kdialog --title \'title\' --passivepopup \'msg\' 3')
    AutotestNotification::Linux.kdialog("title", "msg", "image")
  end

  def test_notify_zenity
    AutotestNotification::Linux.expects(:system).with('zenity --info --text=\'msg\' --title=\'title\'')
    AutotestNotification::Linux.zenity("title", "msg", "image")
  end

  def test_has_zenity?
    AutotestNotification::Linux.expects(:system).with('which zenity 2> /dev/null')
    AutotestNotification::Linux.has_zenity?
  end

  def test_has_notify?
    AutotestNotification::Linux.expects(:system).with('which notify-send 2> /dev/null')
    AutotestNotification::Linux.has_notify?
  end

  def test_has_kdialog?
    AutotestNotification::Linux.expects(:system).with('which kdialog 2> /dev/null')
    AutotestNotification::Linux.has_kdialog?
  end

  private

  def verify_notify(method)
    AutotestNotification::Linux.expects(method).returns("title", "msg", "image", 1)
    AutotestNotification::Linux.notify("title", "msg", "image", 1, 1)
  end

end

