Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  get '/apartments', to: 'apartments#index'
  get '/apartments/new', to: 'apartments#new'
  post '/apartments', to: 'apartments#create'
  get '/apartments/:id', to: 'apartments#show'
  get '/apartments/:id/edit', to: 'apartments#edit'
  patch '/apartments/:id', to: 'apartments#update'
  delete '/apartments/:id', to: 'apartments#destroy'

  get '/tenants', to: 'tenants#index'
  get '/tenants/new', to: 'tenants#new'
  post '/tenants', to: 'tenants#create'
  get '/tenants/:id', to: 'tenants#show'
  get '/tenants/:id/edit', to: 'tenants#edit'
  patch '/tenants/:id', to: 'tenants#update'
  delete '/tenants/:id', to: 'tenants#destroy'

  get '/locations', to: 'locations#index'
  get '/locations/new', to: 'locations#new'
  post '/locations', to: 'locations#create'
  get '/locations/:id', to: 'locations#show'
  get '/locations/:id/edit', to: 'locations#edit'

end
