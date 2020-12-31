class TaskTemplateTask < ApplicationRecord
  belongs_to :task_template

  validates :name, presence: true  
end
