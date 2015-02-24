class CreateMachineModels < ActiveRecord::Migration
  def change
    create_table :machine_models do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
