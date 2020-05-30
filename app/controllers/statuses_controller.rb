class StatusesController < ApplicationController

    def index
        @status_values = Status.all
        render json: @status_values
    end

    def create
        @status = Status.create(
            value: params[:value],
            sort_id: params[:sort_id],
            active: params[:active]
        )
        render json:@status, status: 200
    end
end
