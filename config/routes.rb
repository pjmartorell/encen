Encen::Application.routes.draw do
  devise_for :users, :controllers => {:sessions => 'user_sessions'}

  match 'contact', :to => "static#contact"
  match 'gallery', :to => "static#gallery"
  match 'particular', :to => "static#particular"
  match 'empresas', :to => "static#empresas"
  match 'finques', :to => "static#finques"
  match 'seguros', :to => "static#seguros"

  root :to => "static#index"
end
