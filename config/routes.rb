Rails.application.routes.draw do
  root to: 'static_pages#top'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  
  resources :users, only: %i[new create]
  resources :exhibitions do
    collection do
      get :my_exhibition
    end
    resources :works, only: %i[create], shallow: true
  end

end
