require File.dirname(__FILE__) + '/../test_helper.rb'

class TestMac < Test::Unit::TestCase
  
  def setup
    AutotestNotification.const_set :DOOM_EDITION, false
    AutotestNotification.const_set :SPEAKING, false
    AutotestNotification.const_set :STICKY, false
    AutotestNotification.const_set :BUUF, false
    AutotestNotification.const_set :SUCCESS_SOUND, ''
    AutotestNotification.const_set :FAILURE_SOUND, ''
    AutotestNotification::Mac.stubs(:system)
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
  
  def test_success_sound_is_played_when_specified_and_test_success
    AutotestNotification.const_set :SUCCESS_SOUND, sound_path 
    AutotestNotification::Mac.expects(:play).with(sound_path)
    AutotestNotification::Mac.notify("title", "msg", "image", 1, 0)
  end
  
  def test_failure_sound_is_played_when_specified_and_tests_fail
    AutotestNotification.const_set :FAILURE_SOUND, sound_path
    AutotestNotification::Mac.expects(:play).with(sound_path)
    AutotestNotification::Mac.notify("title", "msg", "image", 1, 1)
  end
  
  def test_failure_sound_is_not_played_when_tests_success
    AutotestNotification.const_set :FAILURE_SOUND, sound_path
    AutotestNotification::Mac.expects(:play).with(sound_path).times(0)
    AutotestNotification::Mac.notify("title", "msg", "image", 1, 0)
  end
  
  def test_success_sound_is_not_played_when_tests_fail
    AutotestNotification.const_set :SUCCESS_SOUND, sound_path
    AutotestNotification::Mac.expects(:play).with(sound_path).times(0)
    AutotestNotification::Mac.notify("title", "msg", "image", 1, 1)
  end
  
  def test_play_method_exists
    # this should be testing if playsound is being called
    assert_respond_to AutotestNotification::Mac, :play
  end
  
  def test_notify_with_buuf
    AutotestNotification.const_set :BUUF, true
    AutotestNotification::Mac.expects(:system).with("growlnotify -n autotest --image image -p 0 -m 'msg' -t title")
    AutotestNotification::Mac.notify("title", "msg", "image", 1, 1)
  end
end

def sound_path
  "#{File.expand_path(File.dirname(__FILE__) + "/../../sounds/doom/")}/1.wav"
end