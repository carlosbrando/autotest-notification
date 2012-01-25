$:.unshift(File.expand_path('..', File.dirname(__FILE__)))
require 'test_helper'

class TestCygwin < Test::Unit::TestCase

  def test_notify
    AutotestNotification::Cygwin.expects(:get_image_path).with("image").returns(" image       ")
    AutotestNotification::Cygwin.expects(:system).with('sncmd /m \'title\' \'msg\' \'image\' /t 3')
    AutotestNotification::Cygwin.notify("title", "msg", "image")
  end
end
