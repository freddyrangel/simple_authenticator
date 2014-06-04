Rails.application.routes.draw do
  mount SimpleAuthenticator::Engine => '/simple_authenticator'
end
