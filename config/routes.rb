Rails.application.routes.draw do  
  devise_for :users

  resources :user
  resources :bdraft
  resources :group

  root to: 'public#homepage'

  get 'external', to: 'bdraft#external', as: 'external'
  get 'Group_transactions/:id', to: 'group#group_transactions', as: 'group_transactions'
  get 'groups', to: 'group#create', as: 'create'
end
 