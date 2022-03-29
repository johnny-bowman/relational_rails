Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/crags', to: 'crags#index'
  get '/crags/new', to: 'crags#new'
  get '/crags/:id', to: 'crags#show'
  get '/crags/:crag_id/climbs', to: 'crag_climbs#index'
  get '/crags/:crag_id/edit', to: 'crags#edit'
  post '/crags', to: 'crags#create'
  patch '/crags/:crag_id', to: 'crags#update'


  get '/climbs', to: 'climbs#index'
  get '/climbs/:id', to: 'climbs#show'
  get '/crags/:crag_id/climbs/new', to: 'crag_climbs#new'
  post "/crags/:crag_id/climbs", to: 'crag_climbs#create'
  get '/climbs/:id/edit', to: 'climbs#edit'
  patch "/climbs/:id", to: 'climbs#update'
end
