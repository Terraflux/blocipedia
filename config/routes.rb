Rails.application.routes.draw do
  
  resources :wikis

  devise_for :users

  resources :charges, only: [:new, :create, :destroy]

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#about'

end
