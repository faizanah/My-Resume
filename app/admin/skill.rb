ActiveAdmin.register Skill do
  permit_params :name , :skill_type_id , :score
  filter :name
  menu label: "Skills" , parent: "Skills" , priority: 5
  config.per_page = [10, 50, 100]
  before_create do |skill|
    skill.admin_user_id = current_admin_user.id
  end

  controller do
    def scoped_collection
      super.where(admin_user_id: current_admin_user.id)
    end
  end

  index download_links: false do |org|
    column  :name do |skill|
      best_in_place skill, :name, url: [:admin, skill]
    end
    column :score do |skill|
      (skill.score * 10).to_s + "%"
    end
    column :skill_type
    actions
  end

  show do
    attributes_table do
      row :name
      row :skill_type
      row :score do |skill|
        (skill.score * 10).to_s + "%"
      end
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Skill" do
      f.input :name
      f.input :skill_type
      f.input :score
    end
    f.actions
  end
end
