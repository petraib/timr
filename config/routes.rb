Rails.application.routes.draw do
  # Routes for the Author resource:
  # CREATE
  get "/authors/new", :controller => "authors", :action => "new"
  post "/create_author", :controller => "authors", :action => "create"

  # READ
  get "/authors", :controller => "authors", :action => "index"
  get "/authors/:id", :controller => "authors", :action => "show"

  # UPDATE
  get "/authors/:id/edit", :controller => "authors", :action => "edit"
  post "/update_author/:id", :controller => "authors", :action => "update"

  # DELETE
  get "/delete_author/:id", :controller => "authors", :action => "destroy"
  #------------------------------

  # Routes for the Model resource:
  # CREATE
  get "/models/new", :controller => "models", :action => "new"
  post "/create_model", :controller => "models", :action => "create"

  # READ
  get "/models", :controller => "models", :action => "index"
  get "/models/:id", :controller => "models", :action => "show"

  # UPDATE
  get "/models/:id/edit", :controller => "models", :action => "edit"
  post "/update_model/:id", :controller => "models", :action => "update"

  # DELETE
  get "/delete_model/:id", :controller => "models", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # Routes for the Indicator resource:
  # CREATE
  get "/indicators/new", :controller => "indicators", :action => "new"
  post "/create_indicator", :controller => "indicators", :action => "create"

  # READ
  get "/indicators", :controller => "indicators", :action => "index"
  get "/indicators/:id", :controller => "indicators", :action => "show"

  # UPDATE
  get "/indicators/:id/edit", :controller => "indicators", :action => "edit"
  post "/update_indicator/:id", :controller => "indicators", :action => "update"

  # DELETE
  get "/delete_indicator/:id", :controller => "indicators", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
