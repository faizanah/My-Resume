ActiveAdmin.register Skill do
  menu priority: 5
  permit_params :name , :skill_type_id , :score
  filter :name

  before_create do |skill|
    skill.admin_user_id = current_admin_user.id
  end

  index do |org|
    column :name
    column :score do |skill|
      (skill.score * 10).to_s + "%"
    end
    column :skill_type
    actions
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
