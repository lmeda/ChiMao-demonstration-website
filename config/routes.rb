Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: "pages#about"
  devise_for :administrators

  resources :showcases
  resources :workbenches
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
