$:.unshift(File.expand_path('..', File.dirname(__FILE__)))
require 'test_helper'

class TestFreeBSD < Test::Unit::TestCase

  def setup
    turn_methods_public AutotestNotification::FreeBSD
    AutotestNotification.const_set :DOOM_EDITION, false
    AutotestNotification.const_set :SPEAKING, false
    AutotestNotification.const_set :STICKY, false
    AutotestNotification.const_set :BUUF, false
  end

  def test_notify_when_use_notify_without_speak
    AutotestNotification::FreeBSD.expects(:has_notify?).returns(true)
    verify_notify(:notify_send)
  end

  def test_notify_when_use_zenity_without_speak
    AutotestNotification::FreeBSD.expects(:has_notify?).returns(false)
    AutotestNotification::FreeBSD.expects(:has_zenity?).returns(true)
    verify_notify(:zenity)
  end

  def test_notify_when_use_kdialog_without_speak
    AutotestNotification::FreeBSD.expects(:has_notify?).returns(false)
    AutotestNotification::FreeBSD.expects(:has_zenity?).returns(false)
    AutotestNotification::FreeBSD.expects(:has_kdialog?).returns(true)
    verify_notify(:kdialog)
  end

  def test_notify_when_use_notify_with_speak
    AutotestNotification.const_set :SPEAKING, true
    AutotestNotification::FreeBSD.expects(:has_notify?).returns(true)
    AutotestNotification::FreeBSD.expects(:system).with("/usr/local/bin/espeak '1 test failed'")
    verify_notify(:notify_send)
  end

  def test_notify_when_use_zenity_with_speak
    AutotestNotification.const_set :SPEAKING, true
    AutotestNotification::FreeBSD.expects(:has_notify?).returns(false)
    AutotestNotification::FreeBSD.expects(:has_zenity?).returns(true)
    AutotestNotification::FreeBSD.expects(:system).with("/usr/local/bin/espeak '1 test failed'")
    verify_notify(:zenity)
  end

  def test_notify_when_use_kdialog_with_speak
    AutotestNotification.const_set :SPEAKING, true
    AutotestNotification::FreeBSD.expects(:has_notify?).returns(false)
    AutotestNotification::FreeBSD.expects(:has_zenity?).returns(false)
    AutotestNotification::FreeBSD.expects(:has_kdialog?).returns(true)
    AutotestNotification::FreeBSD.expects(:system).with("/usr/local/bin/espeak '1 test failed'")
    verify_notify(:kdialog)
  end

  def test_notify_send
    AutotestNotification::FreeBSD.expects(:system).with('notify-send -h int:transient:1 -t 3000 -i image -u normal \'title\' \'msg\'')
    AutotestNotification::FreeBSD.notify_send("title", "msg", "image")
  end

  def test_notify_kdialog
    AutotestNotification::FreeBSD.expects(:system).with('kdialog --title \'title\' --passivepopup \'<img src="image" align="middle"> msg\' 3')
    AutotestNotification::FreeBSD.kdialog("title", "msg", "image")
  end

  def test_notify_zenity
    AutotestNotification::FreeBSD.expects(:system).with('zenity --info --text=\'msg\' --title=\'title\'')
    AutotestNotification::FreeBSD.zenity("title", "msg", "image")
  end

  def test_has_zenity?
    AutotestNotification::FreeBSD.expects(:system).with('which zenity > /dev/null 2>&1')
    AutotestNotification::FreeBSD.has_zenity?
  end

  def test_has_notify?
    AutotestNotification::FreeBSD.expects(:system).with('which notify-send > /dev/null 2>&1')
    AutotestNotification::FreeBSD.has_notify?
  end

  def test_has_kdialog?
    AutotestNotification::FreeBSD.expects(:system).with('which kdialog > /dev/null 2>&1')
    AutotestNotification::FreeBSD.has_kdialog?
  end

  private

  def verify_notify(method)
    AutotestNotification::FreeBSD.expects(method).returns("title", "msg", "image", 1)
    AutotestNotification::FreeBSD.notify("title", "msg", "image", 1, 1)
  end
end
