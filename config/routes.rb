Encen::Application.routes.draw do
  post "toggle_edition_mode", :to => "application#toggle_edition_mode"
  get "unsubscribe", :to => "mailchimp#unsubscribe"

  resources :subscriptors, :only => :create

  scope "(:locale)", :constraints => {:locale => /ca/} do
    devise_for :users, :controllers => {:sessions => 'user_sessions'}

    match 'aboutus', :to => "static#aboutus"
    # match 'zapatitos', :to => "static#zapatitos"
    match 'deportivas', :to => "static#deportivas"
    match 'findus', :to => "static#findus"
    match 'reseller', :to => "static#reseller"
    match 'share', :to => "static#share"
    match 'press', :to => "static#press"
    match 'subscribe', :to => "static#subscribe"
    match 'news', :to => "static#news"
    match 'links', :to => "static#links"
    match 'collection_spring_summer', :to => "static#collection-spring-summer"
    match 'collection_fall_winter', :to => "static#collection-fall-winter"
    match 'collection_taygra', :to => "static#collection-taygra"

    namespace :admin do
      resources :users, :except => :index
      resources :subscriptors, :only => [:index, :destroy]

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
