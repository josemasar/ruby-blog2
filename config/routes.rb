# frozen_string_literal: true

Rails.application.routes.draw do
  resources :categories
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
  resources :articles do
    resources :comments, only: %i[create destroy update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
