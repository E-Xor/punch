Punch::Application.routes.draw do
  # resources :employees
  resources :clocks, only: [:new, :create]

  root :to => 'clocks#new'
end
