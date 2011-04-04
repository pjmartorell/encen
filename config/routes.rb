Encen::Application.routes.draw do
  post "toggle_edition_mode", :to => "application#toggle_edition_mode"

  scope "(:locale)" do
    devise_for :users, :controllers => {:sessions => 'user_sessions'}

    match 'contacto' => 'static#contacto', :as => :contacto
    match 'administradores' => 'static#administradores', :as => :administradores
    match 'servicios' => 'static#servicios', :as => :servicios
    match 'promociones' => 'static#promociones', :as => :promociones
    match 'limpieza' => 'static#limpieza', :as => :limpieza
    match 'conserjeria' => 'static#conserjeria', :as => :conserjeria
    match 'jardineria' => 'static#jardineria', :as => :jardineria
    match 'piscinas' => 'static#piscinas', :as => :piscinas

    match 'question' => 'static#question'
    match 'new_question' => 'static#new_question'

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
