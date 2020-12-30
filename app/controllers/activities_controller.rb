class ActivitiesController < ApplicationController
    
    def index
        @activities = Activity.all
        render json: @activities
    end

    def create
        @activity = Activity.create(activity_params)
        render json: @activity, status: 200
    end

    private
    def activity_params
        params.require(:activity).permit(:value, :sort_id, :active)
    end

end
