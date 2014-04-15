NkuProject::Application.routes.draw do
  root to: "artists#index"
  
  resources :artists do
    resources :pieces
  end
  resources :sessions
  resources :pieces
  
  
  get "sign_out", to: "sessions#destroy", as: :destroy_session

end
