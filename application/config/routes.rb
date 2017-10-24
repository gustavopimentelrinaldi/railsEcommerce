Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'
  root 'site#home'
  get 'backoffice', to: 'backoffice#home'
  get 'search', to: 'search#ads'
  get 'ads/index'
  get 'profile/dashboard'
  resources :ads, only: [:edit, :update, :new, :create]
  resources :ad_detail, only: [:show]
  resources :categories, only: [:show]
  resources :comments, only: [:create]
  resources :profile_my_data, only: [:edit, :update]
  
  namespace :backoffice do
    get 'admins/index'
    resources :send_mail, only: [:edit, :create]
    resources :categories, except: [:show]
    resources :admins, except: [:show]
    resources :diagrams, only: [:index]
  end
  
  devise_for :admins, :skip => [:registrations]
  devise_for :members, controllers: { 
    sessions: 'members/sessions',
    registrations: 'members/registrations'
   }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
