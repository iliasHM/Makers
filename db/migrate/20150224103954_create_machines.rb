class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.integer :length
      t.integer :width
      t.text :description
      t.references :machine_model, index: true

      t.timestamps null: false
    end
    add_foreign_key :machines, :machine_models
  end
end
