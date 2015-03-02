class AddWorkshopToMachines < ActiveRecord::Migration
  def change
    add_reference :machines, :workshop, index: true
    add_foreign_key :machines, :workshops

  end
end
