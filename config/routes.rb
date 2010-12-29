Encen::Application.routes.draw do
  devise_for :users, :controllers => {:sessions => 'user_sessions'}

  match 'contact', :to => "static#contact"
  match 'reformas', :to => "static#reformas"
  match 'estanterias', :to => "static#estanterias"
  match 'altillos', :to => "static#altillos"
  match 'carpinteria', :to => "static#carpinteria"
  match 'toldos', :to => "static#toldos"
  match 'persianas', :to => "static#persianas"
  match 'rep_persianas', :to => "static#rep_persianas"
  match 'rejas', :to => "static#rejas"
  match 'cortinas', :to => "static#cortinas"
  match 'motorizacion', :to => "static#motorizacion"
  match 'gallery', :to => "static#gallery"

  match 'admin', :to => "admin/translations#index"
  root :to => "static#index"
end
