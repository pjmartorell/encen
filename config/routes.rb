Encen::Application.routes.draw do
  devise_for :users, :controllers => {:sessions => 'user_sessions'}

  match 'contacto' => 'static#contacto', :as => :contacto
  match 'administradores' => 'static#administradores', :as => :administradores
  match 'servicios' => 'static#servicios', :as => :servicios
  match 'promociones' => 'static#promociones', :as => :promociones
  match 'limpieza' => 'static#limpieza', :as => :limpieza
  match 'conserjeria' => 'static#conserjeria', :as => :conserjeria
  match 'jardineria' => 'static#jardineria', :as => :jardineria
  match 'piscinas' => 'static#piscinas', :as => :piscinas

  match 'question' => 'static#question'
  match 'new_question' => 'static#new_question'

  match 'admin', :to => "interpret/translations#index"
  root :to => "static#index"
end
