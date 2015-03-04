module Accounts
  class OrdersController < ApplicationController
    before_action :find_user
    def index
      @orders = @user.orders
    end

    private

    def order_params
      params.require(:order).permit(:user_id, :machine_id, :machine_material_id, :description, :created_at, :updated_at)
    end

    def find_user
       @user = current_user
    end
  end
end