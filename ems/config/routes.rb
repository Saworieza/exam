Rails.application.routes.draw do
  resources :students

  devise_for :users, controllers: { sessions: 'users/sessions' }
  root 'home#index'
end
