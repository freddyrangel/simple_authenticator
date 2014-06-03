SimpleAuthenticator::Engine.routes.draw do
  resources :user_sessions, only: [:new, :create, :destroy]
end
