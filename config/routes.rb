ArcticIndexClone::Application.routes.draw do

  match "jobs/job_select" =>'jobs#job_select', :method => :get, :as => :job_select
  resources :jobs, :except => [:destroy]
  
  resources :admin, :only => [:index, :destroy]
  resources :events

  match "search" =>'search#index', :method => :get

  resources :companies, :except => [:destroy]
  resources :people do
    resources :companies, :controller => :people_companies
  end
  
  resource  :session, :only => [:new, :create, :destroy]
  resources :investors, :only => :index
  resources :abuses, :only => :create

  match 'signup'   => 'users#new',        :as => :signup
  match 'register' => 'users#create',     :as => :register
  match 'login'    => 'sessions#new',     :as => :login
  match 'logout'   => 'sessions#destroy', :as => :logout
  match '/activate/:activation_code' => 'users#activate', :as => :activate, :activation_code => nil

  root :to => "home#index"
end
