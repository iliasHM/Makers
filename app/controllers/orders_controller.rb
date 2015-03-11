class OrdersController < ApplicationController
  before_action :find_user

  def create
    @order          = Order.new(order_params)
    @order.maker    = @order.machine.workshop.maker
    @order.designer = current_user
    @order.state    = "asking"
    @order.price    = 0

    if @order.save
      flash.now[:notice] = "Order send to maker"
      redirect_to account_orders_path
    else
      flash.now[:alert] = "Unable to send order"
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:machine_id, :machine_material_id, :description)
  end

  def find_user
     @user = current_user
  end
end
