Encen::Application.routes.draw do
  post "toggle_edition_mode", :to => "application#toggle_edition_mode"
  get "unsubscribe", :to => "mailchimp#unsubscribe"

  resources :subscriptors, :only => :create

  #scope "(:locale)" do
    devise_for :users, :controllers => {:sessions => 'user_sessions'}

    match 'contact', :to => "static#contact"
    match 'gallery', :to => "static#gallery"

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
    
    resources :posts

    #match "/:post", :to => "posts#show"
    match "/:page", :to => "pages#show"
    root :to => "posts#index"
  #end
end
