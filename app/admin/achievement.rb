ActiveAdmin.register Achievement do
  menu priority: 98
  permit_params :title , :icon , :description , :date

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

  filter :title


  index download_links: false do |org|
    column :icon do |interest|
      div class: "#{interest.icon} font-35" do
      end
    end
    column :title
    actions
  end

  form class: 'form-horizontal' do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Achievements" do
      f.input :title
      f.input :description
      f.input :date
      div class: "row" do
        div class: 'col-md-3'do
        end
        div class: "col-md-9" do
          button class: 'btn btn-default' , role: "iconpicker" , "data-icon": "#{f.object.icon}" , name: "achievement[icon]" do
            "Select Icon"
          end
        end
      end
    end
    f.actions
  end

end
