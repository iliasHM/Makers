module MachinesHelper
  def model_picture(version=nil)
    if machine.machine_model.model_picture
      machine.machine_model.model_picture
    else
      machine.category.icon.url(version)
    end
  end
end
