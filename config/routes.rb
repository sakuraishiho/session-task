# config/routes.rb
Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy], path: 'sessions', as: :new_session
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy], path: 'users', as: :users
  root 'tasks#index' # 任意でタスク一覧をホームに設定
end
