class Accounts::MachinesController < ApplicationController
  before_action :find_user

  def new
    @machine = @user.machines.build
    @machine.machine_materials.build  #génération d'un machine_material vide
    # @brands = Brand.all
    @categories = Category.all
    # @models = MachineModel.all
    @materials = Material.all.map { |m| [m.name, m.id] }

  end

  def create
    @materials = Material.all
    @machine = @user.machines.build(machines_params_create)
    binding.pry
    # description = machines_params_create[:description]
    # brand = Brand.find(machines_params_create[:brand])
    # category = Category.find(machines_params_create[:category])
    # machine_model = MachineModel.find(machines_params_create[:machine_model])
    # machine_material = MachineMaterial.find(machines_params_create[:machine_material])
    # @machine = @user.machines.build(brand: brand, category: category, machine_model: machine_model, description: description)

    if @machine.save
      redirect_to accounts_machines_path
    else
      @materials = Material.all.map { |m| [m.name, m.id] }
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
    params.require(:machine).permit(:machine_model_id, :description, machine_materials_attributes: [ :material_id, :colors ])
  end

  def find_user
    @user = current_user
  end

end
