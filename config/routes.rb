Encen::Application.routes.draw do
  
  namespace :admin do
    resources :concerts, :only => [:index, :edit, :update, :destroy, :new, :create]
    resources :images, :only => :destroy
    resources :pages, :only => [:new, :create, :index, :destroy] do
      resources :images, :only => :create
      resources :page_contents, :only => [:edit, :update, :destroy, :new, :create]
    end
    resources :posts do
      resources :images, :only => :create
    end
    resources :subscriptors, :only => [:index, :destroy]
    root :to => "users#index"
    resources :users, :except => :index
  end

  devise_for :users, :controllers => {:sessions => 'user_sessions'}
  get "unsubscribe", :to => "mailchimp#unsubscribe"
  match 'contact', :to => "static#contact"
  match 'gallery', :to => "static#gallery"
  match 'newsletter', :to => "static#newsletter"
  resources :albums
  resources :concerts, :only => :index
  resources :posts do
    resources :comments, :only => [:create, :destroy]
  end
  resources :subscriptors, :only => :create
  root :to => "posts#index"
  match "/:page", :to => "pages#show"
end

