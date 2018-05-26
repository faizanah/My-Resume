ActiveAdmin.register Experience do
  menu priority: 2
  permit_params :job_title ,:organization_name, :logo , :organization_url, :period_start, :period_end , :organization_description , lists_attributes: [ :id , :listable_id , :listable_type ,:description , :_destroy, :_create, :_update ]

  before_create do |experience|
    experience.admin_user_id = current_admin_user.id
  end

  filter :title

  controller do
    def scoped_collection
      super.where(admin_user_id: current_admin_user.id)
    end
  end

  index download_links: false do |org|
    column :job_title
    column :organization_name
    column :period_start
    column :period_end
    actions
  end


  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "General Information" do
      f.input :job_title
      f.input :period_start , label: "Start"
      f.input :period_end , label: "End"
    end

    f.inputs "Company/Organization Information" do
      f.input :organization_name , label: "Name"
      f.input :logo
      f.input :organization_description , label: "Description"
      f.input :organization_url , label: "Website"
    end

    f.inputs "Description of your experience" do
      f.has_many :lists , as: " ", allow_destroy: true,  new_record: true do |c|
        c.input :description , label: " "
        c.input :listable_type ,:input_html => { :value => "Experience" }, as: :hidden
      end
    end
    f.actions
  end

end
