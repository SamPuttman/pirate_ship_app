Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #root 'welcome#index'
  root 'pirate_ships#index'

  resources :pirate_ships do
    resources :crew_members
  end

  get '/crew_members/all', to: 'crew_members#all_index', as: 'all_crew_members'


  #get '/pirate_ships', to: 'pirate_ships#index'
  #get '/pirate_ships', to: 'pirate_ships#new'
  #get '/pirate_ships/:id', to: 'pirate_ships#show', as: 'parent'
  #get '/crew_members', to: 'crew_members#all_index', as: 'all_crew_members'
  #get '/crew_members/:id', to: 'crew_members#show'

  #https://guides.rubyonrails.org/routing.html

end
