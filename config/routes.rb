Ritly::Application.routes.draw do

  resources :users, :sessions

  get '/signup' => 'users#new'
  delete '/signout', to: 'sessions#destroy'
  get'/signin' => 'sessions#new'
  

  #ritly routes
  root to: 'links#index'
  
  get '/all', to: 'links#all'
  
  get '/go/:placeholdervariableidontcare/preview', to: 'links#preview', as: :preview

  post '/go', to: 'links#create'

  get '/go/:placeholdervariableidontcare', to: 'links#redirect', as: :redirect
  
  delete '/go/:id', to: 'links#delete'

  # get '/go/:placeholdervariableidontcare/edit', to: 'links#edit'
  
  # patch '/go/:placeholdervariableidontcare', to: 'links#update'  

end
