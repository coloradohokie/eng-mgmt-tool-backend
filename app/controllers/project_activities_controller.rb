class ProjectActivitiesController < ApplicationController

    def index
        @activities = ProjectActivity.all
        render json: @activities, include: [:project, :activity]
    end

    def create
        @activity = ProjectActivity.create(project_activities_params)
        render json:@activity, include: [:project, :activity], status: 200
    end

    private
    def project_activities_params
        params.require(:project_activity).permit(
            :activity_id, 
            :project_id, 
            :activity_date, 
            :notes, 
            :important, 
            :archived
        )
    end
end
