class TasksController < ApplicationController

    def index
        @tasks = Task.all
        render json: @tasks
    end

    def create
        @task = Task.create(
            project_id: params[:project_id],
            name: params[:name],
            template_name: params[:template_name],
            done: false,
            active: true,
            sort_id: 99
        )

        render json: @task, status: :accepted
    end

    def update
        @task = Task.find(params[:id])
        @task.update(
            project_id: params[:project_id],
            name: params[:name],
            template_name: params[:template_name],
            done: params[:done],
            sort_id: params[:sort_id],
            active: params[:active]
        )
        render json: @task, json: Task.find(params[:id]), status: :accepted
    end

end
