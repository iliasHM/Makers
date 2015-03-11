module Accounts
  class ReceivedOrdersController < ApplicationController
    before_action :find_user

    def update
      @order            = current_user.received_orders.find(params[:id])
      @order.attributes = order_params

      if @order.propose_price
        flash[:notice] = "Price proposed to designer"
        redirect_to account_workshop_path
      else
        flash.now[:alert] = "Unable to propose price to designer"
        render 'accounts/workshops/show'
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