class StatusValuesController < ApplicationController

    def index
        @status_values = StatusValue.all
        render json: @status_values
    end
end
