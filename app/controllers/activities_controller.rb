class ActivitiesController < ApplicationController

    def index
        @activities = Activity.all
        render json: @activities, include: [:project, :activity_value]
    end

    def create
        @activity = Activity.create(
            activity_value_id: params[:activity_value_id],
            project_id: params[:project_id],
            activity_date: params[:activity_date],
            notes: params[:notes],
            important: params[:important],
            archived: params[:archived]
        )
        render status: 200
    end

end
