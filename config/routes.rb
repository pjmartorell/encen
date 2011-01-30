Encen::Application.routes.draw do
  devise_for :users, :controllers => {:sessions => 'user_sessions'}

  match 'contact', :to => "static#contact"
  match 'gallery', :to => "static#gallery"

  namespace :admin do
    resources :users, :except => :index

    root :to => "users#index"
  end

  #match 'admin', :to => "interpret/translations#index"
  root :to => "static#index"
end
