class AddAttachmentModelPictureToMachineModels < ActiveRecord::Migration
  def self.up
    change_table :machine_models do |t|
      t.attachment :model_picture
    end
  end

  def self.down
    remove_attachment :machine_models, :model_picture
  end
end
