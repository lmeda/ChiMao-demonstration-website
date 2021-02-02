Rails.application.routes.draw do
  resources :contacts, except: [:edit, :update]
  get 'feedback', to: "contacts#index"
  get 'contact_chimao', to: "contacts#new"
  post 'contact_chimao', to: "contacts#create"
  root 'pages#home'
  get 'about', to: "pages#about"
  get 'product', to: "pages#products"
  devise_for :administrators

  resources :messages
  get 'news', to: "messages#index"

  resources :standards, only: [:new, :create, :edit, :update, :destroy]
  resources :showcases
  resources :workbenches
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
