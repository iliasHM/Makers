class Accounts::MachinesController < ApplicationController
  before_action :find_user

  def new
    @machine = @user.machines.build
    @brands = Brand.all
    @categories = Category.all
    @models = MachineModel.all
  end

  def create
      @machine = @user.machines.build(machines_params_create)
      # @machine.available = true
      if @machine.save
        redirect_to accounts_machines_path(@machine)
      else
        render :new
      end
  end

  def edit
    @machine = @user.machines.find(params[:id])
  end

  def index
    @machines = @user.machines
  end



  private

  def machines_params_create
    params.require(:machine).permit(:brand, :category, :machine_model, :description)
  end

  def find_user
    @user = current_user
  end

end
