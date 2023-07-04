Rails.application.routes.draw do
  root to: 'words#index'
  resources :words, only: [:index, :new, :create, :destroy, :edit, :update]
end
