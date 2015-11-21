Rails.application.routes.draw do
  root 'welcome#index'

  resources :gif, only: [:index, :create, :update]
  resources :ping, except: [:destroy]
  resources :note, except: [:destroy]
  resources :notebooks, except: [:destroy]
end
