Encen::Application.routes.draw do
  devise_for :users

  match 'contact', :to => "static#contact"
  match 'gallery', :to => "static#gallery"

  root :to => "static#index"
end
