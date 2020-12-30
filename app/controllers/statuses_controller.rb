class StatusesController < ApplicationController

    def index
        @status_values = Status.all
        render json: @status_values
    end

    def create
        @status = Status.create(status_params)
        render json:@status, status: 200
    end

    def destroy
        @status = Status.find(params[:id])
        @status.destroy
        render status: 200
    end

    private

    def status_params
        params.require(:status).permit(:value, :sort_id, :active)
    end
end
