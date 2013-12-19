Punch::Application.routes.draw do
  resources :employees, only: [:index, :create, :destroy]

  resources :clocks, only: [:new, :create]
  get 'report', to: 'clocks#report'

  root to: 'clocks#new'
end
