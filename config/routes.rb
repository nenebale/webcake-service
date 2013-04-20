WebcakeService::Application.routes.draw do
  resources :customers do
    resources :websites
  end
  resources :emails
  match '/' => redirect("http://www.webcake.ch")
end
