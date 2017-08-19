Rails.application.routes.draw do

  devise_for :users

  resources :topics

  resources :bookmarks

  root 'topics#index'
end
