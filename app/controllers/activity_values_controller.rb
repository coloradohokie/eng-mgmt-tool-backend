class ActivityValuesController < ApplicationController
    
    def index
        @activity_values = ActivityValue.all
        render json: @activity_values
    end
end
