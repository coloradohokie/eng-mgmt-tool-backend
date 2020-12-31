class TasksController < ApplicationController

    def index
        @tasks = Task.all
        render json: @tasks
    end

    def create
        task_params[:sort_id] = 99
        @task = Task.create(task_params)
        @project = Project.find(task_params[:project_id])
        @project.update(last_action: "#{@task.name} task added to project")

        render json: @task, status: :accepted
    end

    def update
        @task = Task.find(params[:id])
        @task.project.update(last_action: "#{@task.name} marked completed") if task_params[:done] && !@task[:done] 
        @task.project.update(last_action: "#{@task.name} marked not completed") if !task_params[:done] && @task[:done]
        @task.update(task_params)

        render json: @task, status: :accepted
    end

    private
    def task_params
        params.require(:task).permit(
            :project_id,
            :name,
            :template_name,
            :done,
            :active,
            :sort_id
        )
    end

end
