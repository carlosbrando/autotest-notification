require File.dirname(__FILE__) + '/../test_helper.rb'

class TestMac < Test::Unit::TestCase
  
  def test_notify_without_voice
    Object.const_set :SPEAKING, false 
    AutotestNotification::Mac.expects(:system).with("growlnotify -n autotest --image image -p 0 -m 'msg' title")
    AutotestNotification::Mac.notify("title", "msg", "image", 1)
  end
  
  def test_notify_with_voice
    Object.const_set :SPEAKING, true 
    AutotestNotification::Mac.expects(:system).with("growlnotify -n autotest --image image -p 0 -m 'msg' title")
    AutotestNotification::Mac.expects(:system).with("say 1 test failed.")
    AutotestNotification::Mac.notify("title", "msg", "image", 1)
  end
  
end
