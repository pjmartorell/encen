Encen::Application.routes.draw do
  post "toggle_edition_mode", :to => "application#toggle_edition_mode"

  devise_for :users, :controllers => {:sessions => 'user_sessions'}

  match 'especialidades', :to => "static#areas_of_practice"
  match 'consulta', :to => "static#query"
  match 'civil', :to => "static#civil"
  match 'penal', :to => "static#criminal"
  match 'familiar', :to => "static#family"
  match 'sucesions', :to => "static#sucesions"
  match 'contacto', :to => "static#contact"

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
