require 'comfy_poll'
require 'rails'

module ComfyPoll
  class Engine < Rails::Engine
    initializer 'comfy_poll.configuration' do |app|
      if defined?(ComfortableMexicanSofa)
        # Applying configuraion
        ComfyPoll.configure do |conf|
          conf.admin_route_prefix = ComfortableMexicanSofa.config.admin_route_prefix
          conf.admin_controller   = 'CmsAdmin::BaseController'
          conf.form_builder       = 'ComfortableMexicanSofa::FormBuilder'
        end
        # Adding view hooks
        ComfortableMexicanSofa::ViewHooks.add(:navigation, '/admin/poll/navigation')
      end
    end
  end
end