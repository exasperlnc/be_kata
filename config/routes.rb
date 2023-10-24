Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v0 do
      get 'get_current_user', to: 'sessions#get_current_user'
      post 'login', to: 'sessions#create'
    end
  end
end
