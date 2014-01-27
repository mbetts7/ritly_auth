Ritly::Application.routes.draw do
  
  root 'links#index'
  
  get '/all', to: 'links#all'
  
  get '/go/:placeholdervariableidontcare/preview', to: 'links#preview', as: :preview

  post '/go', to: 'links#create'

  get '/go/:placeholdervariableidontcare', to: 'links#redirect', as: :redirect
  
  delete '/go/:id', to: 'links#delete'

  get '/go/:placeholdervariableidontcare/edit', to: 'links#edit'
  
  # patch '/go/:placeholdervariableidontcare', to: 'links#update'  

end
