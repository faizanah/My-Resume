ActiveAdmin.register Profile do
  menu priority: 1
  actions :all, :except => [:destroy , :new]
  permit_params :full_name,:title , :map_url , :theme_id , :resume , :about, :email, :phone , :image , :web_url, :address , admin_user_attributes: [:id, :_update , media_links_attributes: [ :id, :admin_user_id , :name, :icon , :url , :_destroy, :_create, :_update ]]
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
        f.input :about , as: :ckeditor
      end

      tab 'Contact Details' do
        f.input :email
        f.input :phone
        f.input :address
        f.input :map_url
        f.input :web_url
      end

      tab 'Job Details' do
        f.input :title , label: "Resume Title"
        f.input :resume
      end

      tab 'Social Links' do

        f.inputs " ", for: [:admin_user, current_admin_user] do |u|
          u.has_many :media_links , allow_destroy: true,  new_record: true do |c|
            c.input :name
            c.input :url
            c.input :icon , input_html: { class: "input-iconpicker" }
          end
        end
      end

      tab 'Theme' do
        f.input :theme
      end
    end
    f.actions
  end

end
