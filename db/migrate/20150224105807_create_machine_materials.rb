class CreateMachineMaterials < ActiveRecord::Migration
  def change
    create_table :machines_materials do |t|
      t.references :machine, index: true
      t.references :material, index: true

      t.timestamps null: false
    end
    add_foreign_key :machines_materials, :machines
    add_foreign_key :machines_materials, :materials
  end
end
