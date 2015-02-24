class CreateMachineMaterials < ActiveRecord::Migration
  def change
    create_table :machine_materials do |t|
      t.references :machine, index: true
      t.references :material, index: true
      t.string :colors

      t.timestamps null: false
    end
    add_foreign_key :machine_materials, :machines
    add_foreign_key :machine_materials, :materials
  end
end
