Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :v1, defaults:{format: :json} do
    # get 'comments/index'
    get 'posts/show_posts'
    resources :posts do
      resources :comments
    end
  end
end
