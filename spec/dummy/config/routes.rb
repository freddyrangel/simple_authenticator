Rails.application.routes.draw do
  root "simple_authenticator/user_sessions#new"
  mount SimpleAuthenticator::Engine => '/simple_authenticator'
end
