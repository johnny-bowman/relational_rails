Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/crags', to: 'crags#index'
  get '/crags/new', to: 'crags#new'
  post '/crags', to: 'crags#create'

  get '/crags/:id', to: 'crags#show'
  patch '/crags/:crag_id', to: 'crags#update'
  delete '/crags/:crag_id', to: 'crags#delete'
  get '/crags/:crag_id/edit', to: 'crags#edit'

  get '/crags/:crag_id/climbs/new', to: 'crag_climbs#new'
  post "/crags/:crag_id/climbs", to: 'crag_climbs#create'
  get '/crags/:crag_id/climbs', to: 'crag_climbs#index'

  get '/climbs', to: 'climbs#index'
  get '/climbs/:id', to: 'climbs#show'
  get '/climbs/:id/edit', to: 'climbs#edit'
  patch "/climbs/:id", to: 'climbs#update'
  delete "/climbs/:id", to: 'climbs#delete'
end
