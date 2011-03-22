Encen::Application.routes.draw do
  

  scope "(:locale)" do
    devise_for :users, :controllers => {:sessions => 'user_sessions'}

    match 'contact', :to => "static#contact"
    match 'gallery', :to => "static#gallery"

    namespace :admin do
      resources :users, :except => :index

      resources :posts do
        resources :comments, :only => :create
        resources :images, :only => :create
      end

      resources :comments, :only => :destroy
      resources :images, :only => :destroy

      root :to => "users#index"
    end

    root :to => "static#index"
  end
end
