ActiveAdmin.register Achievement do
  menu priority: 98
  permit_params :title , :icon , :description , :date

  before_create do |achievement|
    achievement.admin_user_id = current_admin_user.id
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
    column :icon do |achievement|
      div class: "#{achievement.icon} font-35" do
      end
    end
    column  :title do |achievement|
      best_in_place achievement, :title, url: [:admin, achievement]
    end
    column  :date
    actions
  end

  show do
    attributes_table do
      row  :title do |achievement|
        best_in_place achievement, :title, url: [:admin, achievement]
      end
      row :icon do |achievement|
        div class: "#{achievement.icon} font-35" do
        end
      end
      row :date
      row  :description do |achievement|
        best_in_place achievement, :description, url: [:admin, achievement]
      end
      row :created_at
      row :updated_at
    end
  end

  form class: 'form-horizontal' do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Achievements" do
      f.input :title
      f.input :description , as: :text
      f.input :date
      f.input :icon , input_html: { class: "input-iconpicker" }
    end
    f.actions
  end

end