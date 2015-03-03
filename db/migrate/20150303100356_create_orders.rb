class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :state
      t.string :file
      t.integer :price_cents
      t.text :description
      t.references :machine, index: true
      t.references :machine_material, index: true

      t.timestamps null: false
    end
    add_foreign_key :orders, :machines
    add_foreign_key :orders, :machine_materials
  end
end
