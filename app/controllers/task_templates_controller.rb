class TaskTemplatesController < ApplicationController

    def index
        @task_templates = TaskTemplate.all
        render json: @task_templates
    end



end
