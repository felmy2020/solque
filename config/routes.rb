Rails.application.routes.draw do
  root 'questions#index'
  get 'search', to: 'questions#search'
  resources :questions do
    resources :answers, only: [:create, :destroy]
  end
end
