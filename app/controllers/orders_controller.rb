class OrdersController < ApplicationController
  before_action :find_user

  def index
    @orders = @user.orders
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to account_orders_path
    else
      render :new
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
