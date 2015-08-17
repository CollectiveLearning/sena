Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create] do
    collection do
      get 'destroy', as: 'destroy'
    end
  end
  resources :users
  root 'pages#home'
end
