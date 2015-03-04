module Accounts
  class OrdersController < ApplicationController
    before_action :find_user
    def index
      @orders = @user.orders
    end

    def update
      @order            = current_user.orders.find(params[:id])

      if @order.accept
        flash[:notice] = "Accepted proposition"
        redirect_to account_path
      else
        flash.now[:alert] = "Unable to accept proposition"
        render 'accounts/orders/'
      end
    end

    private

    def order_params
      params.require(:order).permit(:price)
    end

    def find_user
       @user = current_user
    end
  end
end