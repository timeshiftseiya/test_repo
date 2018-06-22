Rails.application.routes.draw do
  
  

  devise_for :users
  
  resources :users, only: [:index,:show]
  
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
  
  post "/logout" => "devise/sessions#destroy", :as => :destroy_user_session

  
  
  resources :relationships, only: [:create, :destroy]
   
   
   
  resources :wines do
    resources :comments
      collection do
        post :confirm
      end
  end
  
  resources :favorites, only: [:create, :destroy, :index]
  
 
end
