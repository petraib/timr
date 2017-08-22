Rails.application.routes.draw do
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
