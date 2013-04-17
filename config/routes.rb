WebcakeService::Application.routes.draw do
  resources :customers
  resources :emails
  match '/' => redirect("http://www.webcake.ch")
end
