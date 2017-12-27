ActiveAdmin.register Experience do
  menu priority: 2
  permit_params :job_title ,:organization_name, :organization_url, :period_start, :period_end , :summary
  before_create do |experience|
    experience.admin_user_id = current_admin_user.id
  end
  filter :title
  index do |org|
    column :job_title
    column :organization_name
    column :period_start
    column :period_end
    actions
  end


  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Personal Information" do
      f.input :job_title , label: "Title"
      f.input :organization_name , label: "Company"
      f.input :organization_url , label: "Url"
      f.input :period_start
      f.input :period_end
      f.input :summary , as: :froala_editor
    end
    f.actions
  end

end
