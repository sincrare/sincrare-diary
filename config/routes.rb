Rails.application.routes.draw do
  root "articles#index"

  devise_for :users

  resources :articles, only: [:index, :show] do
    resources :article_images, only: :show
    resources :comments, only: :create
  end

  namespace :admin do
    resources :articles
    resources :article_images, only: :create
  end
end
