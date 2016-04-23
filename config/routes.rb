Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :gifs, only: [:index, :create, :update, :new]
  resources :ping, except: [:destroy]
  resources :note, except: [:destroy]
  resources :notebooks, except: [:destroy]
  resources :shelves, except: [:destroy]
  resources :binders, only: [:index]
  get 'shelves/*path' =>'shelves#index'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :binders, except: [:destroy, :new]
      resources :notebooks, except: [:destroy, :new]
      resources :shelves, except: [:destroy, :new]
      resources :dividers, except: [:destroy, :new]
      resources :notes, except: [:new]
    end
  end
end
