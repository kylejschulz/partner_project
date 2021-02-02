Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'climbing_gym#index'
  get '/locations', to: 'locations#index'
  get '/locations/new', to: 'locations#new'
  get '/locations', to: 'locations#create'
end
