ActiveAdmin.register Project do
  menu priority: 7
  permit_params :title , :image , :tags ,  :url , :summary , project_category_ids: []

  before_create do |project|
    project.admin_user_id = current_admin_user.id
  end

  filter :title

  index do |org|
    column :title
    column :image
    column :tags
    # column :project_category
    column :url
    actions
  end


  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Project Details" do
      f.input :title , label: "Title"
      f.input :image
      f.input :tags
      f.input :project_categories, label: "Categories" , as: :check_boxes
      f.input :url , label: "Url"
      f.input :summary
    end
    f.actions
  end

end
