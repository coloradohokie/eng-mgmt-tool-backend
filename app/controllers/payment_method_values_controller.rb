class PaymentMethodValuesController < ApplicationController

    def index
        @payment_method_values = PaymentMethodValue.all
        render json: @payment_method_values
    end
end
