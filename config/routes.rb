Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/crags', to: 'crags#index'
  get '/crags/:id', to: 'crags#show'

  get '/climbs', to: 'climbs#index'
  get '/climbs/:id', to: 'climbs#show'

end
