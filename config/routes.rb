RssReader::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users

  resources :channels

  resources :channel_articles, :only => [:index, :update]

  resources :articles, :only => [:show] do
    resources :comments, :only => [:create]
  end

  root :to => "home#index"
end

