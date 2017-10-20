Rails.application.routes.draw do

  root 'site#home'
  get 'backoffice', to: 'backoffice#home'

  get 'ads/index'
  get 'profile/dashboard'
  resources :ads, only: [:edit, :update, :new, :create]
  resources :ad_detail, only: [:show]
  resources :categories, only: [:show]
  
  namespace :backoffice do
    get 'admins/index'
    resources :send_mail, only: [:edit, :create]
    resources :categories, except: [:show]
    resources :admins, except: [:show]
  end
  
  devise_for :admins, :skip => [:registrations]
  devise_for :members, controllers: { sessions: 'members/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
