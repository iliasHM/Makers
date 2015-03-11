class AddMakerIdToOrders < ActiveRecord::Migration
  def change
    rename_column :orders, :user_id, :designer_id
    add_column    :orders, :maker_id, :integer, index: true
  end
end
