class TaskTemplatesController < ApplicationController

    def index
        @task_templates = TaskTemplate.all
        render json: @task_templates
    end

    def create
        @task_template = TaskTemplate.create(
            value: params[:value],
            sort_id: params[:sort_id],
            active: params[:active]
        )
        render json:@task_template, status: 200
    end

end
