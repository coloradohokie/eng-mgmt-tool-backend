class ActivitiesController < ApplicationController
    
    def index
        @activities = Activity.all
        render json: @activities
    end

    def create
        @activity = Activity.create(
            value: params[:value],
            sort_id: params[:sort_id],
            active: params[:active]
        )
        render json: @activity, status: 200
    end

end
