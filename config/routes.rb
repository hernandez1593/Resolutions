Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users


  resources :resolutions
  namespace :admin do
    root 'dashboard#show'
    resources :users, only: [:index, :show, :destroy]
    resources :mentors
    resources :admins
    resources :clients
    resources :tags
  end

  namespace :mentor do
    root 'dashboard#show'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
