ActiveAdmin.register User do


  index do
    selectable_column
    column :id
    column :name
    column :email
    column :owner_of
    actions defaults: false do |user|
      link_to "View", admin_user_path(user)
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
