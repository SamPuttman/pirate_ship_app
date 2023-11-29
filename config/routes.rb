Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/', to: 'welcome#index'
  get '/parents', to: 'pirate_ships#index'
  get '/parents/:id', to: 'pirate_ships#show', as: 'parent'

end
