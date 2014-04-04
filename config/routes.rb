NkuProject::Application.routes.draw do
  root to: "artists#index"
  
  resources :artists
  resources :sessions
  
  get "sign_out", to: "sessions#destroy", as: :destroy_session

end
