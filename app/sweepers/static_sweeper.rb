class StaticSweeper < Interpret::BaseSweeper
  def expire_cache(translation)
    expire_page :controller => "/static", :action => "index"
    expire_page :controller => "/static", :action => "administradores"
    expire_page :controller => "/static", :action => "conserjeria"
    expire_page :controller => "/static", :action => "contacto"
    expire_page :controller => "/static", :action => "jardineria"
    expire_page :controller => "/static", :action => "limpieza"
    expire_page :controller => "/static", :action => "piscinas"
    expire_page :controller => "/static", :action => "promociones"
    expire_page :controller => "/static", :action => "servicios"
  end
end

