Encen::Application.routes.draw do
  devise_for :users, :controllers => {:sessions => 'user_sessions'}

  match 'contact', :to => "static#contact"
  match 'gallery', :to => "static#gallery"
  match 'aboutus', :to => "static#aboutus"

  root :to => "static#index"
end
