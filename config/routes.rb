Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :hero_powers, only: [:create]
  resources :powers, only: [:index, :show, :create, :update]
  resources :heros, only: [:index, :show]
  #  using summary method in serializer 
  get '/heros/:id/summary', to: 'heros#summary'
  


end
