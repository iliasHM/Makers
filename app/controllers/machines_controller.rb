class MachinesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @machines = Machine.all
  end

  def search
  end

  def show
    @machine = Machine.find(params[:id])
  end
end
