class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :workshops, :users
  end
end
