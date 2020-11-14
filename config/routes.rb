Rails.application.routes.draw do
  devise_for :users
  root 'stocks#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :stocks, only: [:index,:new,:show,:create,:edit,:update,:destroy]
   get 'groups' => "groups#index"
   post '/stocks/:id/edit' => "stocks#index"
  resources :users, only: [:index, :edit, :update]
  resources :groups, only: [:new, :create, :edit, :update] do  
    resources :messages, only: [:index, :create]
    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json'}
    end
  end
end
