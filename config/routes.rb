Vignette::Application.routes.draw do
  
  root 'home#index'
  resources :sessions, :customers, :photographers, :users, :invitations, :albums

  get 'customers/:id', to: 'customers#show'
  get 'photographers/:id', to: 'photographers#show'

  get '/earlyaccess/:invitation_token', to: 'sessions#new', as: 'earlyaccess'
  get 'signup', to: 'customers#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  # OmniAuth Stuff
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match '/auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  post 'albums', to: 'albums#create'
end
