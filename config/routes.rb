Encen::Application.routes.draw do
  devise_for :users, :controllers => {:sessions => 'user_sessions'}

  match 'contacto', :to => "static#contacto"
  match 'servicios', :to => "static#servicios"
  match 'empresas', :to => "static#empresas"
  match 'noticias', :to => "static#noticias"

  match 'admin', :to => "admin/translations#index"
  root :to => "static#index"
end
