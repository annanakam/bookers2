Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  get "/homes/about" => "homes#about", as: "about"
  
  # ↓要るやつ、不要なやつ確認する
  
  resources :users, only: [:new, :index, :show, :edit]
  resources :books, only: [:new, :index, :show, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
