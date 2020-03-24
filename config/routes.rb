Rails.application.routes.draw do
  resources :clients
  resources :project_tasks
  resources :tasks
  resources :activities
  resources :projects
  resources :task_categories
  resources :activity_values
  resources :payment_method_values
  resources :status_values
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
