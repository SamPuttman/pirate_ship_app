Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/', to: 'welcome#index'
  get '/pirate_ships', to: 'pirate_ships#index'
  get '/pirate_ships/:id', to: 'pirate_ships#show', as: 'parent'
  get '/crew_members', to: 'crew_members#index'
  get '/crew_members/:id', to: 'crew_members#show'

  resources :pirate_ships do
    resources :crew_members, only: [:index]
  end


end
