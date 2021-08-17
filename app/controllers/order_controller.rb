class OrderController < ApplicationController
    include ActionController::HttpAuthentication::Token::ControllerMethods
    TOKEN = "secret"

    before_action :authenticate, except: [ :show ]

    def show
        @order = Order.find_by_id(params[:id])
        render json: @order
    end

    def create
        begin
            ActiveRecord::Base.transaction do
                @order = Order.new(permit_params)
                @order.save!
            end
        rescue StandardError => e
            error_for_user = "#{e}"
        end

        if error_for_user
            render json: {error: error_for_user} 
        else 
            render json: {order_id: @order.id}
        end
    end

    private

    def permit_params()
        params.permit(:coin, :amount, :extra1, :extra2)
    end

    def authenticate
        authenticate_or_request_with_http_token do |token, options|
          ActiveSupport::SecurityUtils.secure_compare(token, TOKEN)
        end
      end
end
