ActiveAdmin.register Category do

  permit_params :name, :icon

  index do |ad|
    selectable_column
    column :id
    column "Icon" do |event|
    image_tag(event.icon.url(:little))
    end
    column :name
    actions
  end

  form :html => {:multipart => true} do |f|
  f.inputs "Category Details" do
    f.input :name
    f.input :icon, required: false, :as => :file
    # Will preview the image when the object is edited
  end
  f.actions
 end

 show do |ad|
   attributes_table do
     row :name
     row :icon_file_name
     row :icon do
       image_tag(ad.icon.url(:medium))
     end
     # Will display the image on show object page
   end
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


