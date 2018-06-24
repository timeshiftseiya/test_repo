Rails.application.routes.draw do
  
  resources :wines do
    resources :comments
      collection do
        post :confirm
      end
  end
  
  devise_scope :user do
    root :to => "devise/sessions#new"
    get 'logout', to: "devise/sessions#destroy", as: "logout"
  end

  devise_for :users
  
  resources :users, only: [:index,:show]
  
  resources :relationships, only: [:create, :destroy]
  
  resources :favorites, only: [:create, :destroy, :index]
  
 
end
