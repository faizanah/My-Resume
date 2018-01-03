ActiveAdmin.register Profile do
  menu priority: 1
  actions :all, :except => [:destroy , :new]
  permit_params :full_name,:title ,:facebook_url , :git_url , :linkedin_url , :map_url , :theme_id , :resume , :about, :email, :phone , :image , :web_url, :address
  config.filters = false

  controller do
    def scoped_collection
      super.where(admin_user_id: current_admin_user.id)
    end
  end

  index download_links: false do |org|
    column :full_name
    column :title
    column :email
    column :phone
    actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    tabs do
      tab 'Personal Details' do
        f.input :full_name
        f.input :image
      end

      tab 'Contact Details' do
        f.input :email
        f.input :phone
        f.input :address
        f.input :map_url
        f.input :web_url
      end

      tab 'Job Details' do
        f.input :title , label: "Current Job Title/Position"
        f.input :about , as: :ckeditor
        f.input :resume
      end

      tab 'Social Links' do
        f.input :facebook_url
        f.input :linkedin_url
        f.input :git_url
      end

      tab 'Theme' do
        f.input :theme
      end
    end
    f.actions
  end

end
