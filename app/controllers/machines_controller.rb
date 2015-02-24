class MachinesController < ApplicationController
  def index
    @machines = Machine.all
  end

  def search
  end

  def show
    @machine = Machine.find(params[:id])
  end
end
