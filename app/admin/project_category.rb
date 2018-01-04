ActiveAdmin.register ProjectCategory do
  menu priority: 6
  permit_params :name
  filter :name
  config.sort_order = 'position_asc'
  menu label: "Category" , parent: "Projects"
  before_create do |experience|
    experience.admin_user_id = current_admin_user.id
  end

  reorderable

  controller do
    def scoped_collection
      super.where(admin_user_id: current_admin_user.id)
    end
  end

  index as: :reorderable_table , download_links: false do |org|
    column  :name do |project|
      best_in_place project, :name, url: [:admin, project]
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Project Category" do
      f.input :name
    end
    f.actions
  end
end
