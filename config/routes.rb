Rails.application.routes.draw do
  devise_for :users
  root 'questions#index'
  get 'search', to: 'questions#search'
  resources :questions do
    resources :answers, only: [:create, :destroy]
  end
  resources :bookmarks, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :users, only: [:show, :edit, :update]
end
