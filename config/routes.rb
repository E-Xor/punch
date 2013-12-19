Punch::Application.routes.draw do
  # resources :employees

  get 'entrance' => 'clocks#entrance'
  post 'inout' => 'clocks#inout'

  root :to => 'clocks#entrance'
end
