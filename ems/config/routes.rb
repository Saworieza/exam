Rails.application.routes.draw do
  resources :exams do
    member do
      post :publish
      get :enter_results
      post :save_results
    end
  end
  resources :students
  resources :enrollments

  get 'view_completed', to: 'home#view_completed'

  devise_for :users, controllers: { sessions: 'users/sessions' }, skip: [:registrations]

  resource :users, only: [:edit] do
    collection do
      patch 'update_password'
    end
  end

  root 'home#index'
end
