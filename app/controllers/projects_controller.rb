class ProjectsController < ApplicationController

    def index
        @projects = Project.all
        render json: @projects, include: :tasks
    end

    def show
        @project = Project.find(params[:id])
        render json: @project, include: :tasks
    end

end
