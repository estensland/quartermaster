Rails.application.routes.draw do
  root 'welcome#index'

  resources :gifs, only: [:index, :create, :update]
  resources :ping, except: [:destroy]
  resources :note, except: [:destroy]
  resources :notebooks, except: [:destroy]
  resources :binders, only: [:index]
  get 'binders/*path' =>'binders#index'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :binders, except: [:destroy, :new]
      resources :notebooks, except: [:destroy, :new]
      resources :dividers, except: [:destroy, :new]
      resources :notes, except: [:new]
    end
  end
end
