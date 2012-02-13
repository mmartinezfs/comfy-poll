Rails.application.routes.draw do
  
  namespace :admin, :path => ComfyPoll.config.admin_route_prefix do
    namespace :poll do
      resources :questions
    end
  end unless ComfyPoll.config.admin_route_prefix.blank?
  
  namespace :poll do
    resources :answers, :only => [:show, :create]
  end
  
end
