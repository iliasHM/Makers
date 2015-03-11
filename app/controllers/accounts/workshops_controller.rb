module Accounts
  class WorkshopsController < ApplicationController
    def show
      @user = current_user
      @workshop = @user.workshop
    end

    def new
      @workshop = Workshop.new
    end

    def create
      @workshop = Workshop.new(workshop_params)
      @workshop.address = params[:address]
      if @workshop.save
        redirect_to new_account_workshop_machine_path
      else
        render :new
      end
    end

    private

    def workshop_params
      params.require(:workshop).permit(:user_id, :address)
    end
  end
end