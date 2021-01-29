Rails.application.routes.draw do
  
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :subs, except:[:destroy]
  resources :posts, only: [:new, :create, :show, :edit, :update]
end
