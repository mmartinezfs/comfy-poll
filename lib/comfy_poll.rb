# Loading engine only if this is not a standalone installation
unless defined? ComfyPoll::Application
  require File.expand_path('comfy_poll/engine', File.dirname(__FILE__))
end

require File.expand_path('comfy_poll/configuration', File.dirname(__FILE__))

module ComfyPoll
  class << self
    
    def configure
      yield configuration
    end
    
    def configuration
      @configuration ||= Configuration.new
    end
    alias :config :configuration
    
  end
end