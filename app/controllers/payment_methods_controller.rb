class PaymentMethodsController < ApplicationController

    def index
        @payment_method_values = PaymentMethod.all
        render json: @payment_method_values
    end
end
