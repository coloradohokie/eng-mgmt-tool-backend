class StatusesController < ApplicationController

    def index
        @status_values = Status.all
        render json: @status_values
    end
end
