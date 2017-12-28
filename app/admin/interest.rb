ActiveAdmin.register Interest do
  permit_params :name , :icon

  before_create do |interest|
    interest.admin_user_id = current_admin_user.id
  end

  controller do
    def scoped_collection
      super.where(admin_user_id: current_admin_user.id)
    end

    def find_resource
      scoped_collection.where(id: params[:id]).first!
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Interests" do
      f.input :name
      f.input :icon
    end
    f.actions
  end
end
