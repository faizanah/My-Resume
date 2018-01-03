ActiveAdmin.register Project do
  menu priority: 7
  permit_params :title , :image , :tags ,  :url , :summary , project_category_ids: []
  menu parent: "Projects"

  before_create do |project|
    project.admin_user_id = current_admin_user.id
  end

  filter :title

  controller do
    def scoped_collection
      super.where(admin_user_id: current_admin_user.id)
    end

    def find_resource
      scoped_collection.where(id: params[:id]).first!
    end
  end

  index download_links: false do |org|
    column  :title do |project|
      best_in_place project, :title, url: [:admin, project]
    end
    column :image do |project|
      image_tag project.image , width: '70'
    end
    column :tags
    # column :project_category
    column :url
    actions
  end

  show do
    attributes_table do
      row :title
      row :url
      row :image , lable: "Logo" do |project|
        image_tag project.image , width: '70'
      end
      row :tags
      row :summary do |project|
        raw project.summary
      end
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Project Details" do
      f.input :title , label: "Title"
      f.input :image
      f.input :tags
      f.input :project_categories, label: "Categories" , as: :check_boxes
      f.input :url , label: "Url"
      f.input :summary , as: :ckeditor
    end
    f.actions
  end

end
