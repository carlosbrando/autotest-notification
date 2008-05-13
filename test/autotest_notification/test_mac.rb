require File.dirname(__FILE__) + '/../test_helper.rb'

class TestMac < Test::Unit::TestCase
  
  def test_notify
    AutotestNotification::Mac.expects(:system).with("growlnotify -n autotest --image image -p 0 -m 'msg' title")
    AutotestNotification::Mac.notify("title", "msg", "image")
  end
  
end
