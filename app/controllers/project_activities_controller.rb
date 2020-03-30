class ProjectActivitiesController < ApplicationController

    def index
        @activities = ProjectActivity.all
        render json: @activities, include: [:project, :activity]
    end

    def create
        @activity = ProjectActivity.create(
            activity_id: params[:activity_id],
            project_id: params[:project_id],
            activity_date: params[:activity_date],
            notes: params[:notes],
            important: params[:important],
            archived: params[:archived]
        )
        render json:@activity, status: 200
    end

end