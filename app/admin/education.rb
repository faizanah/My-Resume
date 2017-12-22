ActiveAdmin.register Education do
  menu priority: 3
  permit_params :degree ,:school_name, :school_url, :grade , :period_start, :period_end , :summary
  before_create do |education|
    education.admin_user_id = current_admin_user.id
  end

  def scoped_collection
      @educations = current_admin_user.educations
  end

  index do |org|
    column :degree
    column :school_name
    column :period_start
    column :period_end
    actions
  end


  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Educational Information" do
      f.input :degree
      f.input :school_name , label: "School"
      f.input :school_url , label: "Website URL"
      f.input :period_start
      f.input :period_end
      f.input :summary
    end
    f.actions
  end
end
