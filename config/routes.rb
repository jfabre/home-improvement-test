Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  Rails.application.routes.draw do
    devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

    devise_scope :user do
      get 'sign_out', to: 'devise/sessions#destroy', as: :delete_user_session
    end
    
    resources :projects do
      resources :comments, commentable_type: 'Project'
    end

    root "projects#index"
  end
end