class TaskCategoriesController < ApplicationController

    def index
        @task_categories = TaskCategory.all
        render json: @task_categories
    end

end
