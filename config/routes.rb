Rails.application.routes.draw do
  root 'pages#home'
  get '/home', to: 'pages#home'
  
  resources :generic_names do
    resources :reviewgenerics , only: [:create, :edit, :update, :destroy]
  end
  resources :medicaments do
    resources :reviewmeds , only: [:create, :edit, :update, :destroy]
  end
  resources :groups
  resources :subgroups
  resources :substitutions
  resources :generic_names
  resources :medicaments
  resources :producers
  resources :users
  resources :abouts , only: [:index]
  resources :reviews , only: [:index]
  
  get '/login', to: 'logins#new'
    post '/login', to: 'logins#create'
    get '/logout', to: 'logins#destroy'
end