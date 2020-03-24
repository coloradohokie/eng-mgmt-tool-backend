class Project < ApplicationRecord
  has_many :project_tasks
  has_many :tasks, through: :project_tasks
end
