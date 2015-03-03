module Users
  class OrdersController < ApplicationController
    before_action :find_user

    def index
      @orders = @user.orders
    end

    def create
      @order = Order.new(order_params)
      @order.user = current_user
      if @order.save
        redirect_to orders_path
      else

      end
    end

    def update

    end

    def pending
      @machine = Machine.find(params[:machine_id])
      @orders = @machine.orders
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