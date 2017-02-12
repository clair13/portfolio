Rails.application.routes.draw do
  resources :ports, except: [:show]
  get 'port/:id', to: 'ports#show', as: 'port_show'

  get 'about-me', to: 'pages#about'

  get 'contact', to: 'pages#contact'

  resources :blogs

  root to: 'pages#home'
end
