require "test/unit"
require "rubygems"
require 'autotest'
require "mocha"
require File.dirname(__FILE__) + '/../lib/autotest_notification' unless defined?(AutotestNotification)

class Test::Unit::TestCase
  def turn_methods_public(classe, method_name = nil)
    if method_name
      classe.class_eval do
        public method_name
      end
    else
      turn_all_methods_public classe
    end
  end
  def turn_all_methods_public(classe)
    classe.class_eval do
      private_instance_methods.each { |instance_method| public instance_method }
      private_methods.each { |method| public_class_method method } 
      protected_instance_methods.each { |instance_method| public instance_method }
      protected_methods.each { |method| public_class_method method } 
    end  
  end
end
