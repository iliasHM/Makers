class AddUserToMachines < ActiveRecord::Migration
  def change
    add_reference :machines, :user, index: true
    add_foreign_key :machines, :users
  end

end
