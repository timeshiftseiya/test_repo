Rails.application.routes.draw do
  

  devise_for :users
  
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
  
  resources :wines do
    resources :comments
      collection do
        post :confirm
      end
  end
  
  resources :favorites, only: [:create, :destroy, :index]
end
