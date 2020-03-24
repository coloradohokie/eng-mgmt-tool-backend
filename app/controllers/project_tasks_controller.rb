class ProjectTasksController < ApplicationController

    def index
        @project_tasks - ProjectTask.all
        render json: @project_tasks
    end

end
