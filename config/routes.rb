Rails.application.routes.draw do
  
  namespace :admin, :path => ComfyPoll.config.admin_route_prefix do
    namespace :poll do
      resources :questions
    end
  end unless ComfyPoll.config.admin_route_prefix.blank?
  
  namespace :poll do
    resources :questions, :only => [] do
      resources :answers, :only => [:index, :create]
    end
  end
  
end
