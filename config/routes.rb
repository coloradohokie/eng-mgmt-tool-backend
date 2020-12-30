Rails.application.routes.draw do
  resources :task_templates, only: [:create, :index]
  resources :tasks, only: [:index, :create, :update]
  resources :project_activities, only: [:index, :create]
  resources :projects, only: [:index, :show, :create, :update]
  resources :task_categories, only: [:index, :create, :update]
  resources :activities, only: [:index, :create, :update]
  resources :statuses, only: [:index, :create, :destroy]
  resources :users, only: [:create]
  post "login", to: "authentication#login"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
