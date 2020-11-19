Rails.application.routes.draw do
  devise_for :users, controllers:{
      sessions:'users/sessions',
      registrations:'users/registrations',
      passwords:'users/passwords'
    }
  root 'homes#top'
  get 'home/about' => 'homes#about'
  resources :users
  resources :game_items, only: [:index,:new,:create,:show,:edit,:update,:destroy], except: [:index] do
    resource :favorites, only: [:create, :destroy]
  end
  resources :favorites, only: [:index]

  devise_for :admins, controllers:{
      sessions:'admins/sessions',
      registrations:'admins/registrations',
      passwords:'admins/passwords'
    }

  namespace :admins do
    root 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
