ActiveAdmin.register SkillType do
  menu priority: 4
  permit_params :name
  filter :name

  before_create do |experience|
    experience.admin_user_id = current_admin_user.id
  end

  index do |org|
    column :name
    actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Skill Type" do
      f.input :name
    end
    f.actions
  end
end
