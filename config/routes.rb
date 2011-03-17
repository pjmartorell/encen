Encen::Application.routes.draw do
  devise_for :users, :controllers => {:sessions => 'user_sessions'}

  match 'contacto', :to => "static#contact"
  match 'servicios', :to => "static#services"
  match 'noticias', :to => "static#news"
  match 'juridico', :to => "static#legal"
  match 'divorcio', :to => "static#divorce"
  match 'herencia', :to => "static#heredity"
  match 'derecho_laboral', :to => "static#labor-rights"
  match 'pension', :to => "static#pension"
  match 'accidente', :to => "static#accident"
  match 'extranjeria', :to => "static#immigration-laws"
  match 'gestion_laboral', :to => "static#management-labor"
  match 'creacion_cancelacion_sociedades', :to => "static#creation-cancellation-societies"
  match 'procesos', :to => "static#process"
  match 'compra_venta_bienes', :to => "static#real-estate"
  match 'arrendamientos', :to => "static#renting"
  match 'propietarios', :to => "static#owners"

  match 'admin', :to => "admin/translations#index"
  root :to => "static#index"
end
