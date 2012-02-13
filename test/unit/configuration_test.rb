require File.expand_path('../test_helper', File.dirname(__FILE__))

class ConfigurationTest < ActiveSupport::TestCase
  
  def test_configuration
    assert config = ComfyPoll.configuration
    assert_equal 'admin', config.admin_route_prefix
    assert_equal 'ApplicationController', config.admin_controller
    assert_equal 'ActionView::Helpers::FormBuilder', config.form_builder
  end
  
  def test_initialization_overrides
    ComfyPoll.config.admin_route_prefix = 'new-admin'
    assert_equal 'new-admin', ComfyPoll.config.admin_route_prefix
  end
  
end