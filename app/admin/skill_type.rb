ActiveAdmin.register SkillType do
  permit_params :name , :position , skills_attributes: [ :id, :admin_user_id , :name, :score , :_destroy, :_create, :_update ]
  config.filters = false
  menu label: "Types" , parent: "Skills" , priority: 4

  reorderable

  before_create do |object|
    object.admin_user_id = current_admin_user.id
  end

  controller do
    def scoped_collection
      super.where(admin_user_id: current_admin_user.id)
    end

    def find_resource
      scoped_collection.where(id: params[:id]).first!
    end
  end

  index as: :reorderable_table ,:download_links => false do
    column  :name do |project|
      best_in_place project, :name, url: [:admin, project]
    end

    column "No. of Skills" do |skill|
      skill.skills.count
    end

    actions
  end

  # Show
  show do
    attributes_table do
      row  :name do |skill_type|
        best_in_place skill_type, :name, url: [:admin, skill_type]
      end
    end

    panel 'Skills' do
      table_for skill_type.skills do
        column  :name do |skill|
          best_in_place skill, :name, url: [:admin, skill]
        end
        column :score do |skill|
          (skill.score * 10).to_s + "%"
        end
      end
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Skill Type' do
      f.input :name
    end

      f.has_many :skills , allow_destroy: true,  new_record: true do |c|
        c.input :name
        c.input :score
        c.input :admin_user_id, :input_html => { :value => current_admin_user.id }, as: :hidden

      end

    f.actions
  end
end
