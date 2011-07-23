Encen::Application.routes.draw do
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
        resources :images, :only => :create
      end

      resources :images, :only => :destroy

      resources :pages, :only => [:new, :create, :index, :destroy] do
        resources :images, :only => :create
        resources :page_contents, :only => [:edit, :update, :destroy, :new, :create]
      end

      root :to => "users#index"
    end
    
    resources :posts do
      resources :comments, :only => [:create, :destroy]
    end

    #match "/:post", :to => "posts#show"
    match "/:page", :to => "pages#show"
    root :to => "posts#index"
  #end
end
