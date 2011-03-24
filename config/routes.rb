Encen::Application.routes.draw do
  

  scope "(:locale)" do
    devise_for :users, :controllers => {:sessions => 'user_sessions'}

    match 'contacto' => 'static#contact', :as => :contact
    match 'servicios' => 'static#servicios', :as => :servicios
    match 'enlaces' => 'static#enlaces', :as => :enlaces
    match 'noticias' => 'static#noticias', :as => :noticias
    match 'nosotros' => 'static#nosotros', :as => :nosotros

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
