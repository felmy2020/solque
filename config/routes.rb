Rails.application.routes.draw do
  devise_for :users
  root 'questions#index'
  get 'search', to: 'questions#search'
  patch 'bestanswer', to: 'questions#bestanswer'
  resources :questions do
    resources :answers, only: [:create, :destroy]
  end
  resources :bookmarks, only: [:create, :destroy]
  resources :comments, only: [:create, :edit, :update, :destroy]
  resources :users, only: [:show, :edit, :update]
end
