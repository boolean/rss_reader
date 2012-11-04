RssReader::Application.routes.draw do
  resources :channels

  devise_for :users

  root :to => "home#index"
end

