class Task < ApplicationRecord
  has_many :project_tasks
  has_many :projects, through: :project_tasks
  belongs_to :task_category
end
