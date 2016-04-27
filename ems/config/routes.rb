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

  devise_for :users, controllers: { sessions: 'users/sessions' }
  root 'home#index'
end
