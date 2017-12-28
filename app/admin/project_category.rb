ActiveAdmin.register ProjectCategory do
  menu priority: 6
  permit_params :name
  filter :name
  menu label: "Category" , parent: "Projects"
  before_create do |experience|
    experience.admin_user_id = current_admin_user.id
  end

  controller do
    def scoped_collection
      super.where(admin_user_id: current_admin_user.id)
    end
  end

  index download_links: false do |org|
    column :name
    actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Project Category" do
      f.input :name
    end
    f.actions
  end
end
