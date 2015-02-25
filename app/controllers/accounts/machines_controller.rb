class Accounts::MachinesController < ApplicationController
  before_action :find_user

  def new
    @machine = @user.machines.build
  end

  def create
      @machine = @user.machines.build(machines_params_create)
      @machine.available = true
      if @machine.save
        redirect_to profile_machine_path(@machine)
      else
        render :new
      end
    end

  def edit
    @machine = @user.machines.find(params[:id])
  end

  def index
    @machines = @user.planes
  end



  private

  def machines_params_create
    params.require(:machine).permit(:model_id, :brand_id, :category_id)
  end

  def find_user
    @user = current_user
  end

end
