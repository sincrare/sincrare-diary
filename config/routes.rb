Rails.application.routes.draw do
  get 'article_images/show'
  root "articles#index"
  devise_for :users
  resources :articles, only: [:index, :show] do
    resources :article_images, only: :show
  end

  namespace :admin do
    resources :articles
  end

end
