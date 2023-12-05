Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #root 'welcome#index'
# Root path
root 'pirate_ships#index'

# General Crew Members routes
get '/crew_members/all', to: 'crew_members#all_index', as: 'all_crew_members'
get '/crew_members/:id', to: 'crew_members#show', as: 'crew_member'

# Crew Members within the context of a specific Pirate Ship
get '/pirate_ships/:pirate_ship_id/crew_members', to: 'pirate_ships_crew#index', as: 'pirate_ship_crew_members'
get '/pirate_ships/:pirate_ship_id/crew_members/new', to: 'pirate_ships_crew#new', as: 'new_pirate_ship_crew_member'
post '/pirate_ships/:pirate_ship_id/crew_members', to: 'pirate_ships_crew#create'
get '/pirate_ships/:pirate_ship_id/crew_members/:id', to: 'pirate_ships_crew#show', as: 'pirate_ship_crew_member'
get '/pirate_ships/:pirate_ship_id/crew_members/:id/edit', to: 'pirate_ships_crew#edit', as: 'edit_pirate_ship_crew_member'
patch '/pirate_ships/:pirate_ship_id/crew_members/:id', to: 'pirate_ships_crew#update'
get '/pirate_ships/:pirate_ship_id/crew_members/:id/delete', to: 'pirate_ships_crew#destroy', as: 'delete_pirate_ships_crew_member'

# Pirate Ships routes
get '/pirate_ships', to: 'pirate_ships#index', as: 'pirate_ships'
get '/pirate_ships/new', to: 'pirate_ships#new', as: 'new_pirate_ship'
post '/pirate_ships', to: 'pirate_ships#create'
get '/pirate_ships/:id', to: 'pirate_ships#show', as: 'pirate_ship'
get '/pirate_ships/:id/edit', to: 'pirate_ships#edit', as: 'edit_pirate_ship'
patch '/pirate_ships/:id', to: 'pirate_ships#update'
get '/pirate_ships/:id/delete', to: 'pirate_ships#destroy', as: 'delete_pirate_ship'
end
