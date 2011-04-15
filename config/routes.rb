Encen::Application.routes.draw do
  post "toggle_edition_mode", :to => "application#toggle_edition_mode"
  get "unsubscribe", :to => "mailchimp#unsubscribe"

  resources :subscriptors, :only => :create

  match 'contacto', :to => "static#contact"
  match 'servicios', :to => "static#services"
  match 'noticias', :to => "static#news"
  match 'juridico', :to => "static#legal"
  match 'divorcio', :to => "static#divorce"
  match 'herencia', :to => "static#heredity"
  match 'derecho_laboral', :to => "static#labor-rights"
  match 'pension', :to => "static#pension"
  match 'accidente', :to => "static#accident"
  match 'extranjeria', :to => "static#immigration-laws"
  match 'gestion_laboral', :to => "static#management-labor"
  match 'creacion_cancelacion_sociedades', :to => "static#creation-cancellation-societies"
  match 'procesos', :to => "static#process"
  match 'compra_venta_bienes', :to => "static#real-estate"
  match 'arrendamientos', :to => "static#renting"
  match 'propietarios', :to => "static#owners"

  devise_for :users, :controllers => {:sessions => 'user_sessions'}

  namespace :admin do
    resources :users, :except => :index
    resources :subscriptors, :only => [:index, :destroy]

    resources :posts do
      resources :comments, :only => :create
      resources :images, :only => :create
    end

    resources :comments, :only => :destroy
    resources :images, :only => :destroy

    resources :pages, :only => [:new, :create, :index, :destroy] do
      resources :images, :only => :create
      resources :page_contents, :only => [:edit, :update, :destroy, :new, :create]
    end

    root :to => "users#index"
  end

  match "/:page", :to => "pages#show"
  root :to => "static#index"
end
