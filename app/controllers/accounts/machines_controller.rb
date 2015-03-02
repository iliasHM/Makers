module Accounts
  class MachinesController < ApplicationController
    before_action :find_user

    def index
      @machines = @user.machines
    end

    def show
      @machine = @user.machines.find(params[:id])
    end

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
      @machine = @user.workshop.machines.build(machines_params_create)

      if @machine.save
        redirect_to account_machines_path
      else
        @materials = Material.all.map { |m| [m.name, m.id] }
        render :new
      end
    end

    def edit
      @machine = @user.machines.find(params[:id])
    end

    def update
      @machine = @user.machines.find(params[:id])
      if @machine.update_attributes(machines_params_create)
          redirect_to :action => 'show', :id => @machine.id
      else
        render :action => 'edit'
      end
    end

    def destroy
      @machine = @user.machines.find(params[:id])
      @machine.destroy
      redirect_to accounts_machines_path
    end




    private

    def machines_params_create
      params.require(:machine).permit(:machine_model_id, :description, machine_materials_attributes: [ :id, :material_id, :colors, :_destroy ])
    end

    def find_user
      @user = current_user
    end

  end
end
