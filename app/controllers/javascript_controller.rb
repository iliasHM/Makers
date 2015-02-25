class JavascriptController < ApplicationController
  def dynamic_models
    @models = MachineModel.all
  end
end