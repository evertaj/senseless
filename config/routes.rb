Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get '/about' => 'pages#about', as: :about
  get '/contact' => 'pages#contact', as: :contact
  root to: 'posts#index'
  resources :posts do
    collection do
      get :bookmarks
    end
    member do
      get :like
    end
    resources :comments, param: :id, only: [:create, :destroy] do
      get :approve
    end
  end
  devise_for :users
  get '/:id' => 'users#show', as: :user
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
