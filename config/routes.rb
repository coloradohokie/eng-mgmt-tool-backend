Rails.application.routes.draw do
  resources :task_template_tasks
  resources :task_templates
  resources :clients
  resources :project_tasks
  resources :tasks
  resources :project_activities
  resources :projects
  resources :task_categories
  resources :activities
  resources :payment_methods
  resources :statuses
  resources :users, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
