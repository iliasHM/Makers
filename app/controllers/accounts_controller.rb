class AccountsController < ApplicationController
  def show
    @user = current_user
    @workshop = @user.workshop
  end

  # def edit
  #   @user = current_user
  # end

  # def update
  #   current_user.update(account_params)
  #   redirect_to account_path
  # end

  # private

  # def account_params
  #   params.require(:user).permit(:firstname, :lastname, :name, :description, :picture, :phone_number)
  # end
end