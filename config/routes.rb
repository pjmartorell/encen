Encen::Application.routes.draw do
  resources :comments

  scope "(:locale)" do
    devise_for :users, :controllers => {:sessions => 'user_sessions'}

    resources :posts

    match 'contact', :to => "static#contact"
    match 'gallery', :to => "static#gallery"

    namespace :admin do
      resources :users, :except => :index

      root :to => "users#index"
    end

    root :to => "static#index"
  end
end
