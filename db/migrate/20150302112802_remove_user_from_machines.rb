class RemoveUserFromMachines < ActiveRecord::Migration
  def change
    remove_column :machines, :user_id
  end
end
