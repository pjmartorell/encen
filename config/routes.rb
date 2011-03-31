Encen::Application.routes.draw do
  post "toggle_edition_mode", :to => "application#toggle_edition_mode"

  scope "(:locale)" do
    devise_for :users, :controllers => {:sessions => 'user_sessions'}

    match 'aboutus', :to => "static#aboutus"
    match 'zapatitos', :to => "static#zapatitos"
    match 'deportivas', :to => "static#deportivas"
    match 'findus', :to => "static#findus"
    match 'reseller', :to => "static#reseller"
    match 'share', :to => "static#share"
    match 'press', :to => "static#press"
    match 'subscribe', :to => "static#subscribe"
    match 'news', :to => "static#news"
    match 'links', :to => "static#links"

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
