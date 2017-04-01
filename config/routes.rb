Rails.application.routes.draw do
  devise_for :users
  root 'sessions#index'
  resources :boards
  resources :notifications



  namespace :api, :defaults => { :format => :json} do
    as :user do
        post 'sign_in' => 'sessions#create'
        delete 'sign_out' => 'sessions#destroy'
    end
    namespace :v1 do
      resources :boards
      resources :notifications
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
