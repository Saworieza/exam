Rails.application.routes.draw do
  resources :exams, :communications, :programmings, :cores, controller: 'exams'

  resources :students

  devise_for :users, controllers: { sessions: 'users/sessions' }
  root 'home#index'
end
