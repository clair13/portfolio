Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :ports, except: [:show] do
    put :sort, on: :collection
  end
  
  get 'angular-items', to: 'ports#angular'
  get 'port/:id', to: 'ports#show', as: 'port_show'

  get 'about-me', to: 'pages#about'

  get 'contact', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root to: 'pages#home'
end
