ActiveAdmin.register Profile do
  menu priority: 1
  actions :all, :except => [:destroy , :new]
  permit_params :full_name,:title , :about, :email, :phone , :image , :web_url, :address
  config.filters = false
  index do |org|
    column :full_name
    column :title
    column :email
    column :phone
    # column :theme
    actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Personal Information" do
      # f.input :url,:hint => "Website URL"
      f.input :full_name
      f.input :title , label: "Current Job Title/Position"
      f.input :phone
      f.input :email
      f.input :image
      f.input :about
      f.input :web_url
      # f.input :theme
      f.input :address
    end
    f.actions
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
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
