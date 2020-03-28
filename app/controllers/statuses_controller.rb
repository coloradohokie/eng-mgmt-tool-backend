class StatusesController < ApplicationController

    def index
        @status_values = Statuses.all
        render json: @status_values
    end
end
