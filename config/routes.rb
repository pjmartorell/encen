Encen::Application.routes.draw do


  scope "(:locale)" do
    devise_for :users, :controllers => {:sessions => 'user_sessions'}

    match 'contacto', :to => "static#contact"
    match 'premama', :to => "static#pregnant"
    match 'ropa0_3', :to => "static#baby-clothes0-3"
    match 'ropa4_8', :to => "static#baby-clothes4-8"
    match 'cuidados', :to => "static#cares"
    match 'tienda', :to => "static#shop"
    match 'complementos', :to => "static#complements"
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
