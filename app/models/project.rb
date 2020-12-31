class Project < ApplicationRecord
  belongs_to :client
  belongs_to :payment_method
  belongs_to :status
  has_many :tasks
  has_many :project_activities
  has_many :activities, through: :project_activities

  validates :job_number, presence: true
  validates :address1, presence: true
end
