Encen::Application.routes.draw do
  devise_for :users, :controllers => {:sessions => 'user_sessions'}

  match 'contacto' => 'static#contact', :as => :contact
  match 'services' => 'static#services', :as => :services
  match 'vinculo' => 'static#vinculo', :as => :vinculo
  match 'noticias' => 'static#noticias', :as => :noticias
  match 'nosotros' => 'static#nosotros', :as => :nosotros

  namespace :admin do
    resources :users, :except => :index

    root :to => "users#index"
  end

  root :to => "static#index"
end
