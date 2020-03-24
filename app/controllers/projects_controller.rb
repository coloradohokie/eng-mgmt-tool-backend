class ProjectsController < ApplicationController

    def index
        @projects = Project.all
        render json: @projects, include: [:tasks, :client, :payment_method_value, :status_value]
    end

    def show
        @project = Project.find(params[:id])
        render json: @project, include: :tasks
    end

end
