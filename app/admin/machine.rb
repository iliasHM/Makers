ActiveAdmin.register Machine do


  index do
    selectable_column
    column :id
    column :machine_model
    column :brand
    column :category
    column "Created by", :maker
    actions defaults: false do |machine|
      link_to "View", admin_machine_path(machine)
    end
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
