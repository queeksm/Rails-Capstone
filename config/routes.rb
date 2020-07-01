Rails.application.routes.draw do  
  devise_for :users

  resources :user

  root to: "public#homepage"
end
 