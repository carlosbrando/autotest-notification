require File.dirname(__FILE__) + '/../test_helper.rb'

class TestMac < Test::Unit::TestCase
  
  def setup
    AutotestNotification.const_set :DOOM_EDITION, false
    AutotestNotification.const_set :SPEAKING, false
    AutotestNotification.const_set :STICKY, false
    AutotestNotification.const_set :BUUF, false
  end

  def test_notify_without_voice
    AutotestNotification.const_set :SPEAKING, false
    AutotestNotification::Mac.expects(:system).with("growlnotify -n autotest --image image -p 0 -m 'msg' -t title")
    AutotestNotification::Mac.notify("title", "msg", "image", 1)
  end

  def test_notify_with_voice
    AutotestNotification.const_set :SPEAKING, true
    AutotestNotification::Mac.expects(:system).with("growlnotify -n autotest --image image -p 0 -m 'msg' -t title")
    AutotestNotification::Mac.expects(:system).with("say 1 test failed.")
    AutotestNotification::Mac.notify("title", "msg", "image", 1, 1)
  end

  def test_notify_with_pending
    AutotestNotification.const_set :PENDING, true
    AutotestNotification::Mac.expects(:system).with("growlnotify -n autotest --image image -p 0 -m 'msg' -t title")
    AutotestNotification::Mac.notify("title", "msg", "image", 1)
  end
  
  def test_notify_with_sticky
    AutotestNotification.const_set :STICKY, true
    AutotestNotification::Mac.expects(:system).with("growlnotify -n autotest --image image -s -p 0 -m 'msg' -t title")
    AutotestNotification::Mac.notify("title", "msg", "image", 1, 1)
  end
  
  def test_notify_with_buuf
    AutotestNotification.const_set :BUUF, true
    AutotestNotification::Mac.expects(:system).with("growlnotify -n autotest --image image -p 0 -m 'msg' -t title")
    AutotestNotification::Mac.notify("title", "msg", "image", 1, 1)
  end
end