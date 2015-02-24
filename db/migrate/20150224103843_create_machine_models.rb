class CreateMachineModels < ActiveRecord::Migration
  def change
    create_table :machine_models do |t|
      t.string :name
      t.references :brand, index: true
      t.references :category, index: true

      t.timestamps null: false
    end

    add_foreign_key :machine_models, :categories
    add_foreign_key :machine_models, :brands
  end
end
