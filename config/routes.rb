# frozen_string_literal: true

Rails.application.routes.draw do
  resources :authors, only: [:index, :show, :create, :update, :destroy]

  resources :courses, only: [:index, :show, :create, :update, :destroy] do
    resources :talents, only: [:create, :update, :destroy], controller: :course_talents
  end

  resources :learning_paths, only: [:index, :show, :create, :update, :destroy]

  resources :talents, only: [:index, :show, :create, :update, :destroy] do
    resources :learning_paths, only: [:create, :destroy], controller: :talent_learning_paths
  end
end
