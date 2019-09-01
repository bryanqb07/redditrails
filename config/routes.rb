Rails.application.routes.draw do
  namespace :api, :defaults => {:format => 'json'} do 
    resources :users, only: [:create, :new, :show, :index, :destroy]
    resources :subs
    resource :session, only: [:create, :new, :destroy]
    resources :posts, except: [:index] do 
      resources :comments, only: [:new]
    end
    resources :comments, only: [:create, :show]
  end  
  root to: "static_pages#root"
end
