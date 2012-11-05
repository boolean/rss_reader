RssReader::Application.routes.draw do
  devise_for :users

  resources :channels

  resources :channel_articles, :only => [:update]

  resources :articles, :only => [:index, :show] do
    resources :comments, :only => [:create]
  end

  root :to => "home#index"
end

