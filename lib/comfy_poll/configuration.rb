module ComfyPoll
  class Configuration
    
    # Default url to access admin area is http://yourhost/admin/
    attr_accessor :admin_route_prefix
    
    # Controller that should be used for admin area
    attr_accessor :admin_controller
    
    # Form builder
    attr_accessor :form_builder
    
    # Configuration defaults
    def initialize
      @admin_route_prefix     = 'admin'
      @admin_controller       = 'ApplicationController'
      @form_builder           = 'ActionView::Helpers::FormBuilder'
    end
    
  end
end