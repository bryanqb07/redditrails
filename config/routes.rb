Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show, :index, :destroy]
  resources :subs
  resource :session, only: [:create, :new, :destroy]
  resources :posts, except: [:index]
end
