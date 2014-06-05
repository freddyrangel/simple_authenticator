SimpleAuthenticator::Engine.routes.draw do
  resources :user_sessions, only: [:new, :create, :destroy]
  resources :user_registrations, except: [:index, :show]
end
