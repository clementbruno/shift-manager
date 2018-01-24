Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :shifts, only: [:index, :show]
  resources :workers do
    resources :shifts, only: [:new, :create, :edit, :update, :destroy]
  end
end
