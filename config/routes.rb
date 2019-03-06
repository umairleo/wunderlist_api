Rails.application.routes.draw do
  post 'sign_up', to: 'sessions#sign_up'
  post 'sign_in', to: 'sessions#sign_in'
  delete 'sign_out', to: 'sessions#sign_out'
 
  resources :lists do
    resources :tasks
  end
end
