ActiveAdmin.register Profile do
  menu priority: 1
  actions :all, :except => [:destroy , :new]
  permit_params :full_name,:title , :resume , :about, :email, :phone , :image , :web_url, :address
  config.filters = false
  index do |org|
    column :full_name
    column :title
    column :email
    column :phone
    actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Personal Information" do
      f.input :full_name
      f.input :title , label: "Current Job Title/Position"
      f.input :phone
      f.input :email
      f.input :image
      f.input :resume
      f.input :about
      f.input :web_url
      f.input :address
    end
    f.actions
  end

end
