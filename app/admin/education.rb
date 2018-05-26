ActiveAdmin.register Education do
  menu priority: 3
  permit_params :degree ,:school_name, :school_url, :grade , :period_start, :period_end , :summary

  before_create do |education|
    education.admin_user_id = current_admin_user.id
  end

  controller do
    def scoped_collection
      super.where(admin_user_id: current_admin_user.id)
    end
  end
  index download_links: false  do |org|
    column :degree
    column :school_name
    column :period_start
    column :period_end
    actions
  end


  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Educational Information" do
      f.input :degree , label: "Degree Program"
      f.input :school_name , label: "School"
      f.input :period_start , label: "Start Date"
      f.input :period_end , label: "End Date"
      f.input :school_url , label: "Website"
      f.input :summary , label: "Short Description"
    end
    f.actions
  end
end
