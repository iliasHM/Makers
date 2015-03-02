ActiveAdmin.register MachineModel do

  permit_params :name, :brand_id, :category_id, :model_picture

  index do
    selectable_column
    column "Model Picture" do |event|
    image_tag(event.model_picture.url(:little))
    end
    column :id
    column :name
    column :brand
    column :category
    actions
  end

  form :html => {:multipart => true} do |f|
  f.inputs "Model Details" do
    f.input :name
    f.input :brand
    f.input :category
    f.input :model_picture, required: false, :as => :file
    # Will preview the image when the object is edited
  end
  f.actions
 end

  show do |ad|
   attributes_table do
     row :id
     row :name
     row :brand
     row :category
     row :created_at
     row :updated_at
     row :model_picture_file_name
     row :model_picture do
       image_tag(ad.model_picture.url(:medium))
     end
     # Will display the image on show object page
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
