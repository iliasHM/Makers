class JavascriptController < ApplicationController
  def get_models
    @models = MachineModel.where(category_id: params[:category_id])
    respond_to do |format|
      format.js
    end
  end
end