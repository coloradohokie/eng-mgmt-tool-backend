class TasksController < ApplicationController

    def index
        @tasks = Task.all
        render json: @tasks, include: :task_category
    end

end
