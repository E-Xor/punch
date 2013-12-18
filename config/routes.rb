Punch::Application.routes.draw do
  resources :clocks

  root :to => 'clocks#inout'
end
