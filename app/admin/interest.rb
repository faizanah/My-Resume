ActiveAdmin.register Interest do
  actions :all

  menu priority: 100
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

  config.filters = false

  index download_links: false do |org|
    column :icon do |interest|
      div class: "#{interest.icon} font-35" do
      end
    end
    column  :name do |interest|
      best_in_place interest, :name, url: [:admin, interest]
    end
    actions
  end

  show do
    attributes_table do
      row  :name do |interest|
        best_in_place interest, :name, url: [:admin, interest]
      end
      row :icon do |interest|
        div class: "#{interest.icon} font-35" do
        end
      end
      row :created_at
      row :updated_at
    end
  end


  form class: 'form-horizontal' do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Interests" do
      f.input :name
      f.input :icon , input_html: { class: "input-iconpicker" }
    end
    f.actions
  end
end